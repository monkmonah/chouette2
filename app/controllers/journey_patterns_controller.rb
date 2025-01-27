class JourneyPatternsController < ChouetteController
  before_action :check_authorize, except: [:show, :index, :collection]

  defaults :resource_class => Chouette::JourneyPattern

  respond_to :html
  respond_to :json, :only => :index
  respond_to :js, :only => [:new_vehicle_journey, :show]
  respond_to :kml, :only => :show

  belongs_to :referential do
    belongs_to :line, :parent_class => Chouette::Line do
      belongs_to :route, :parent_class => Chouette::Route
    end
  end

  alias_method :route, :parent
  alias_method :journey_pattern, :resource

  def index
    index! do |format|
      format.html { redirect_to referential_line_route_path(@referential,@line,@route) }
    end
  end

  def create_resource(object)
    object.special_update
  end

  def update
    update_destination_display_ids
    update_footnote_ids
    update!
  end

  ## updates StopPoint DestinationDisplay on StopPoint
  # - this is done outside the regular update since JourneyPattern uses the stop_point change event mechanism
  def update_destination_display_ids
    if params[:journey_pattern][:destination_display_ids].present?
      params[:journey_pattern][:destination_display_ids].each do |k, v|
        if v[:stop_point_id].present?
          stop_point_id = v[:stop_point_id]
          destination_display_id = v[:destination_display_id].present? ? v[:destination_display_id] : nil
          Chouette::StopPoint.find(stop_point_id).destination_display_id = destination_display_id
        end
      end
    end
  end

  def show
    @map = JourneyPatternMap.new(journey_pattern).with_helpers(self)
    @stop_points = journey_pattern.stop_points.page(params[:page])
    show! do
      build_breadcrumb :show
    end
  end

  ## updates StopPoint Footnotes on StopPoint
  # - this is done outside the regular update since JourneyPattern uses the stop_point change event mechanism
  def update_footnote_ids
    if params[:journey_pattern][:footnote_ids].present?
      params[:journey_pattern][:footnote_ids].each do |k, v|
        stop_point_id = v[:stop_point_id]
        footnote_tokens = v[:footnote_tokens].split(",")
        Chouette::StopPoint.find(stop_point_id).footnote_ids = footnote_tokens
      end
    end
  end


  def new_vehicle_journey
    @vehicle_journey = Chouette::VehicleJourney.new(:route_id => route.id)
    @vehicle_journey.update_journey_pattern(resource)
    vehicle_journey_category = params[:journey_category] ? "vehicle_journey_#{params[:journey_category]}" : 'vehicle_journey'
    render "#{vehicle_journey_category.pluralize}/select_journey_pattern"
  end

  # overwrite inherited resources to use delete instead of destroy
  # foreign keys will propagate deletion)
  def destroy_resource(object)
    object.delete
  end

  def collection
    @q = route.journey_patterns.ransack( params[:q])
    @journey_patterns ||= @q.result(:distinct => true).order(:name)
  end



  private

  def journey_pattern_params
    params.require(:journey_pattern).permit(:route_id, :objectid, :object_version, :creation_time, :creator_id, :name, :comment, :registration_number, :published_name, :departure_stop_point_id, :arrival_stop_point_id, {:stop_point_ids => [], :destination_display_ids => {}}, :footnote_ids, :footnote_tokens)
  end

end
