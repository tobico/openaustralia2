class MemberController < ApplicationController
  def representatives
    @title = "Representatives"
    @extra_keyword = @title
    @members = Member.find_all_by_house(1)
  end
  
  def senators
    @title = "All Senators"
    @extra_keyword = @title
    @members = Member.find_all_by_house(2)
  end

  def show
    if params[:name].gsub("_", " ") =~ /^(\S*) (\S*)$/
      @member = Member.first(:conditions => {:first_name => $~[1], :last_name => $~[2],
        :constituency => params[:constituency], :house => params[:house]})
      @title = "#{@member.formal_name}, #{@member.constituency}"
      @extra_keyword = @title
    else
      # TODO: Add error handling here
    end
    render :show
  end
end
