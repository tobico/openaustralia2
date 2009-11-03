class Postcodes < ActiveRecord::Base
  set_primary_key "postcode"
  set_table_name "postcode_lookup"
end
