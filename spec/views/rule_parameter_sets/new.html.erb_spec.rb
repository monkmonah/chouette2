require 'spec_helper'

describe "/rule_parameter_sets/new", :type => :view do
  
  assign_organisation
  let!(:organisation) { create(:organisation) }
  let!(:rule_parameter_set) { assign :rule_parameter_set, build( :rule_parameter_set, :organisation => organisation) }
  
  describe "form" do
    
    it "should render input for name" do
      render
      expect(rendered).to have_selector("form") do |form|
        expect(form).to have_selector("input[type=text][value='#{rule_parameter_set.name}']")
      end
    end

    # TODO Fix: didn't find element with id added_mode_parameter_set :(
    it "should render input div for added_mode_parameter_set", skip:true do
      render
      expect(rendered).to have_selector("form") do |form|
        expect(form).to have_selector("#added_mode_parameter_set")
      end
    end
  end
end

