require 'spec_helper'

describe "/stop_areas/new", :type => :view do
  assign_referential
  let!(:stop_area) { assign(:stop_area, build(:stop_area)) }

  describe "form" do
    
    it "should render input for name" do
      render
      expect(rendered).to have_selector("form") do |form|
        expect(form).to have_selector("input[type=text][value='#{stop_area.name}']")
      end
    end
  end
end
