object @stop_area
Rails.logger.debug "inside Rabl view call helper for help_path #{self.inspect}"

node do |stop_area|
  { :id => stop_area.id, :registration_number => stop_area.registration_number || "", :image_path => @options[ :image_path ], :name => stop_area.name || "", :zip_code => stop_area.zip_code || "", :city_name => stop_area.city_name || "" }
end

node :area_type do |area|
  I18n.t("area_types.label.#{area.area_type.underscore}") || ""
end
