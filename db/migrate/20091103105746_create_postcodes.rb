class CreatePostcodes < ActiveRecord::Migration
  def self.up
    execute <<-EOF
     CREATE TABLE `postcode_lookup` (
      `postcode` varchar(10) NOT NULL default '',
      `name` varchar(100) NOT NULL default '',
      KEY  (`postcode`)
    );
    EOF
  end

  def self.down
    drop_table :postcode_lookup
  end
end
