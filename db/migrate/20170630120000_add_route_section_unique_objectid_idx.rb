class AddRouteSectionUniqueObjectidIdx < ActiveRecord::Migration[4.2]
  def change
    add_index "route_sections", ["objectid"], :name => "route_sections_objectid_key", :unique => true
  end
end
