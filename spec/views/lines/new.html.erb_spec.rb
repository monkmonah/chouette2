require 'spec_helper'

describe "/lines/new", :type => :view do
  assign_referential
  let!(:network) { create(:network) }
  let!(:company) { create(:company) }
  let!(:line) { assign(:line, build(:line, :network => network, :company => company )) }

  describe "form" do
    
    it "should render input for name" do
      render
      expect(rendered).to have_selector("form") do |form|
        expect(form).to have_selector("input[type=text][value='#{line.name}']")
      end
    end
  end
end
