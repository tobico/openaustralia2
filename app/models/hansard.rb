class Hansard < ActiveRecord::Base
  set_table_name "hansard"
  set_primary_key "epobject_id"

  belongs_to :text_object, :foreign_key => "epobject_id", :primary_key => "epobject_id"
  belongs_to :speaker, :class_name => "Member"
  belongs_to :section, :class_name => "Hansard", :primary_key => "epobject_id"
  belongs_to :subsection, :class_name => "Hansard", :primary_key => "epobject_id"
  has_many :comments, :foreign_key => "epobject_id", :primary_key => "epobject_id"
  
  def section?
		htype == 10
	end
	
	def subsection?
		htype == 11
	end
	
	def speech?
		htype == 12
	end
	
	def procedural?
	  htype == 13
  end
  
  
  # If database time contains "00:00:00" return null
  def htime
    read_attribute(:htime) unless htime_before_type_cast == "00:00:00"
  end
  
  def Hansard.find_by_id(house, id)
    if house == 1
      house_id = "debate"
    elsif house == 2
      house_id = "lords"
    else
      raise "Unknown house"
    end
    find_by_gid("uk.org.publicwhip/#{house_id}/#{id}")
  end
  
  def id
    if gid =~ /^uk.org.publicwhip\/(debate|lords)\/(.*)/
      $~[2]
    else
      raise "Unexpected form for gid"
    end
  end
  
  # Anchor to identify this speech within a single day
  def anchor
    if gid =~ /^uk.org.publicwhip\/(debate|lords)\/[^.]+\.(.*)/
      "g" + $~[2]
    else
      raise "Unexpected form for gid"
    end
  end
  
  def to_s
    text_object.body
  end
  
  def just_text
    Hpricot(text_object.body).inner_text
  end
  
  # Returns all speeches and procedurals in the given subsection
  def Hansard.speeches_in_subsection(subsection)
    raise "Not a subsection" unless subsection.subsection?
    all(:conditions => {:subsection_id => subsection.epobject_id}, :order => "hpos ASC")
  end
  
  def Hansard.subsections_in_section(section)
    raise "Not a section" unless section.section?
    all(:conditions => {:section_id => section.epobject_id, :htype => 11}, :order => "hpos ASC")
  end
  
  def Hansard.reps_sections_on_date(date)
    all(:conditions => {:htype => 10, :hdate => date, :major => 1}, :order => "hpos ASC")
  end
  
  def previous_speech_within_subsection
    Hansard.first(
      :conditions => ['hdate = ? AND hpos < ? AND subsection_id = ? AND (htype != 10 AND htype != 11)',
        hdate, hpos, subsection_id],
      :order => "hpos DESC")
  end  

  def next_speech_within_subsection
    Hansard.first(
      :conditions => ['hdate = ? AND hpos > ? AND subsection_id = ? AND (htype != 10 AND htype != 11)',
        hdate, hpos, subsection_id],
      :order => "hpos ASC")
  end
  
  def no_speeches
    if section?
      Hansard.count(:conditions => {:section_id => epobject_id, :subsection_id => 0, :htype => 12})
    elsif subsection?
      Hansard.count(:conditions => {:section_id => section_id, :subsection_id => epobject_id, :htype => 12})      
    else
      raise "Only supporting no_speeches for subsections and sections"
    end
  end
  
  def no_comments
    if subsection?
      Comment.count(:include => "speech", :conditions => ["hansard.subsection_id = ?", epobject_id])
    elsif speech? || procedural?
      comments.count
    else
      raise "Only supporting subsection, speech and procedural"
    end
  end
end
