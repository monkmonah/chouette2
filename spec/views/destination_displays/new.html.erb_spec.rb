require 'spec_helper'

describe "/destination_displays/new", :type => :view do
  assign_referential
  let!(:destination_display) { assign(:destination_display, build(:destination_display)) }

  describe "form" do
    
    it "should render input for name" do
      render
      expect(rendered).to have_selector("form") do |form|
        expect(form).to have_selector("input[type=text][value='#{destination_display.name}']")
      end
    end
  end
end
