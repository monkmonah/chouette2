require 'spec_helper'

describe "/vehicle_journeys/_form", :type => :view do
  
  assign_referential
  let!(:line) { assign :line, create(:line) }
  let!(:route) { assign :route, create(:route, :line => line) }
  let!(:vehicle_journey) { assign :vehicle_journey, create(:vehicle_journey, :route => route) }

  it "should render an input for transport_mode" do
    render partial: 'vehicle_journeys/form',
           locals: {
             vehicle_journey: vehicle_journey,
             form_url: referential_line_route_vehicle_journeys_path(referential, line, route, vehicle_journey)
           }
    expect(rendered).to have_selector( "select#vehicle_journey_transport_mode_name") do |node|
      Chouette::Line.transport_modes.each do |mode|
        expect(node).to have_selector("option[value='#{mode}']")
      end
    end
  end

  it "should render an input for comment" do
    render partial: 'vehicle_journeys/form',
           locals: {
             vehicle_journey: vehicle_journey,
             form_url: referential_line_route_vehicle_journeys_path(referential, line, route, vehicle_journey)
           }

    expect(rendered).to have_selector("form") do |form|
      expect(form).to have_selector("input[type=text][name='vehicle_journey[comment]']")
    end
  end

  context "stop's time view part" do
    # What TODO: Funker ikke :(
    it "should render stop's names", skip: true do
      render partial: 'vehicle_journeys/form',
             locals: {
               vehicle_journey: vehicle_journey,
               form_url: referential_line_route_vehicle_journeys_path(referential, line, route, vehicle_journey)
             }

      expect(rendered).to have_selector("form") do |form_node|
        vehicle_journey.stop_points.each do |sp|

          print("sp: ", sp)
          expect(form_node).to have_selector("label", :text => sp.stop_area.name)
        end
      end
    end

    it "renders _vehicle_journey_at_stop_fields partial for each vehicle_journey_at_stop" do
      render partial: 'vehicle_journeys/form',
             locals: {
               vehicle_journey: vehicle_journey,
               form_url: referential_line_route_vehicle_journeys_path(referential, line, route, vehicle_journey)
             }

      expect(view).to render_template(:partial => "_vehicle_journey_at_stop_fields", :count => vehicle_journey.vehicle_journey_at_stops.count)
    end
    
    it "should render vehicle_journey_at_stop's departure time" do
      render partial: 'vehicle_journeys/form',
             locals: {
               vehicle_journey: vehicle_journey,
               form_url: referential_line_route_vehicle_journeys_path(referential, line, route, vehicle_journey)
             }

      expect(rendered).to have_selector("form") do |form_node|
        vehicle_journey.stop_points.each_with_index do |sp, index|
          expect(form_node).to have_selector("select[name='vehicle_journey[vehicle_journey_at_stops_attributes[#{index}][departure_time(4i)]]']")
          expect(form_node).to have_selector("select[name='vehicle_journey[vehicle_journey_at_stops_attributes[#{index}][departure_time(5i)]]']")
        end
      end
    end
  end

  context "when existing vehicle_journey" do
    # What TODO: Its not disabled=true :(
    it "should display objectid not as an input", skip: true do
      render partial: 'vehicle_journeys/form',
             locals: {
               vehicle_journey: vehicle_journey,
               form_url: referential_line_route_vehicle_journeys_path(referential, line, route, vehicle_journey)
             }

      expect(rendered).to have_selector("form") do |form|
        expect(form).to have_selector("input[type=text][value='#{vehicle_journey.objectid}'][disabled=true]")
      end
    end
  end

  context "when new vehicle_journey" do
    let!(:vehicle_journey) { assign :vehicle_journey, build(:vehicle_journey, :route => route) }
    it "should render an input for objectid" do
      render partial: 'vehicle_journeys/form',
             locals: {
               vehicle_journey: vehicle_journey,
               form_url: referential_line_route_vehicle_journeys_path(referential, line, route, vehicle_journey)
             }

      expect(rendered).to have_selector("form") do |form|
        expect(form).to have_selector("input[type=text][value='#{vehicle_journey.objectid}']")
      end
    end
  end
end