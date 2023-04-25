require 'spec_helper'

describe "/companies/new", :type => :view do
  assign_referential
  let!(:company) { assign(:company, build(:company)) }

  describe "form" do
    
    it "should render input for name" do
      render
      expect(rendered).to have_selector("form") do |form|
        expect(form).to have_selector("input[type=text][value='#{company.name}']")
      end
    end
  end
end
