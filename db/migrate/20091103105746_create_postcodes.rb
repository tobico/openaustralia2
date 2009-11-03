class CreatePostcodes < ActiveRecord::Migration
  def self.up
    create_table :postcode_lookup do |t|
      t.string "postcode", :limit => 10,  :default => "", :null => false
      t.string "name",     :limit => 100, :default => "", :null => false
    end
  end

  def self.down
    drop_table :postcode_lookup
  end
end
