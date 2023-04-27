require 'spec_helper'

describe "/networks/new", :type => :view do
  assign_referential
  let!(:network) {  assign(:network, build(:network)) }

  describe "form" do
    it "should render input for name" do
      render
      expect(rendered).to have_selector("form") do |form|
        expect(form).to have_selector("input[type=text][value='#{network.name}']")
      end
    end
  end
end
