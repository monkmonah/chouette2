# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 202301091420900000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "access_links", id: :serial, force: :cascade do |t|
    t.bigint "access_point_id"
    t.bigint "stop_area_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "comment"
    t.decimal "link_distance", precision: 19, scale: 2
    t.boolean "lift_availability"
    t.boolean "mobility_restricted_suitability"
    t.boolean "stairs_availability"
    t.time "default_duration"
    t.time "frequent_traveller_duration"
    t.time "occasional_traveller_duration"
    t.time "mobility_restricted_traveller_duration"
    t.string "link_type"
    t.integer "int_user_needs"
    t.string "link_orientation"
    t.index ["objectid"], name: "access_links_objectid_key", unique: true
  end

  create_table "access_points", id: :serial, force: :cascade do |t|
    t.string "objectid"
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "comment"
    t.decimal "longitude", precision: 19, scale: 16
    t.decimal "latitude", precision: 19, scale: 16
    t.string "long_lat_type"
    t.string "country_code"
    t.string "street_name"
    t.string "contained_in"
    t.time "openning_time"
    t.time "closing_time"
    t.string "access_type"
    t.boolean "lift_availability"
    t.boolean "mobility_restricted_suitability"
    t.boolean "stairs_availability"
    t.bigint "stop_area_id"
    t.string "zip_code"
    t.string "city_name"
    t.index ["objectid"], name: "access_points_objectid_key", unique: true
  end

  create_table "api_keys", id: :serial, force: :cascade do |t|
    t.bigint "referential_id"
    t.string "token"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocks", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id", limit: 255
    t.string "private_code"
    t.string "name"
    t.string "description"
    t.time "start_time"
    t.time "end_time"
    t.integer "end_time_day_offset"
    t.integer "start_point_id"
    t.integer "end_point_id"
    t.index ["end_point_id"], name: "blocks_end_point_id_key"
    t.index ["objectid"], name: "blocks_objectid_key", unique: true
    t.index ["start_point_id"], name: "blocks_start_point_id_key"
  end

  create_table "blocks_dead_runs", primary_key: ["block_id", "dead_run_id"], force: :cascade do |t|
    t.integer "block_id", null: false
    t.integer "dead_run_id", null: false
    t.integer "position"
    t.index ["dead_run_id"], name: "blocks_dead_runs_dead_run_id_idx"
  end

  create_table "blocks_vehicle_journeys", primary_key: ["block_id", "vehicle_journey_id"], force: :cascade do |t|
    t.integer "block_id", null: false
    t.integer "vehicle_journey_id", null: false
    t.integer "position"
    t.index ["vehicle_journey_id"], name: "blocks_vehicle_journeys_vehicle_journey_id_idx"
  end

  create_table "booking_arrangements", id: :serial, force: :cascade do |t|
    t.string "booking_note"
    t.string "booking_access"
    t.string "book_when"
    t.time "latest_booking_time"
    t.time "minimum_booking_period"
    t.bigint "booking_contact_id"
  end

  create_table "booking_arrangements_booking_methods", id: false, force: :cascade do |t|
    t.bigint "booking_arrangement_id"
    t.string "booking_method"
  end

  create_table "booking_arrangements_buy_when", id: false, force: :cascade do |t|
    t.bigint "booking_arrangement_id"
    t.string "buy_when"
  end

  create_table "brandings", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id", limit: 255
    t.string "name"
    t.string "description"
    t.string "url"
    t.string "image"
    t.index ["objectid"], name: "brandings_objectid_key", unique: true
  end

  create_table "codespaces", id: :serial, force: :cascade do |t|
    t.string "xmlns", null: false
    t.string "xmlns_url", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "short_name"
    t.string "organizational_unit"
    t.string "operating_department_name"
    t.string "code"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "registration_number"
    t.string "url"
    t.string "time_zone"
    t.string "organisation_type"
    t.string "legal_name"
    t.string "public_email"
    t.string "public_url"
    t.string "public_phone"
    t.bigint "branding_id"
    t.index ["objectid"], name: "companies_objectid_key", unique: true
    t.index ["registration_number"], name: "companies_registration_number_key"
  end

  create_table "connection_links", id: :serial, force: :cascade do |t|
    t.bigint "departure_id"
    t.bigint "arrival_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "comment"
    t.decimal "link_distance", precision: 19, scale: 2
    t.string "link_type"
    t.time "default_duration"
    t.time "frequent_traveller_duration"
    t.time "occasional_traveller_duration"
    t.time "mobility_restricted_traveller_duration"
    t.boolean "mobility_restricted_suitability"
    t.boolean "stairs_availability"
    t.boolean "lift_availability"
    t.integer "int_user_needs"
    t.index ["objectid"], name: "connection_links_objectid_key", unique: true
  end

  create_table "contact_structures", id: :serial, force: :cascade do |t|
    t.string "contact_person"
    t.string "email"
    t.string "phone"
    t.string "fax"
    t.string "url"
    t.string "further_details"
  end

  create_table "dated_service_journey_refs", id: false, force: :cascade do |t|
    t.integer "original_dsj_id"
    t.integer "derived_dsj_id"
    t.index ["derived_dsj_id"], name: "dated_service_journey_refs_derived_dsj_id_idx"
    t.index ["original_dsj_id", "derived_dsj_id"], name: "dated_service_journey_refs_original_dsj_id_derived_dsj_id_key", unique: true
  end

  create_table "dated_service_journeys", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id", limit: 255
    t.date "operating_day", null: false
    t.integer "vehicle_journey_id", null: false
    t.string "service_alteration"
    t.index ["objectid"], name: "dated_service_journeys_objectid_key", unique: true
    t.index ["vehicle_journey_id"], name: "dated_service_journeys_vehicle_journey_id_idx"
  end

  create_table "dead_run_at_stops", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.bigint "dead_run_id"
    t.bigint "stop_point_id"
    t.time "arrival_time"
    t.time "departure_time"
    t.integer "arrival_day_offset"
    t.integer "departure_day_offset"
    t.index ["dead_run_id"], name: "index_dead_run_at_stops_on_dead_run_id"
    t.index ["stop_point_id"], name: "index_dead_run_at_stops_on_stop_pointid"
  end

  create_table "dead_runs", id: :serial, force: :cascade do |t|
    t.bigint "journey_pattern_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.index ["objectid"], name: "dead_runs_objectid_key", unique: true
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "destination_display_via", id: false, force: :cascade do |t|
    t.bigint "destination_display_id", null: false
    t.bigint "via_id", null: false
    t.bigint "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["destination_display_id"], name: "index_destination_display_id_on_destination_display_via"
  end

  create_table "destination_displays", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "side_text"
    t.string "front_text", null: false
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
  end

  create_table "exports", id: :serial, force: :cascade do |t|
    t.bigint "referential_id"
    t.string "status"
    t.string "type"
    t.string "options"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "references_type"
    t.string "reference_ids"
    t.index ["referential_id"], name: "index_exports_on_referential_id"
  end

  create_table "facilities", id: :serial, force: :cascade do |t|
    t.bigint "stop_area_id"
    t.bigint "line_id"
    t.bigint "connection_link_id"
    t.bigint "stop_point_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "comment"
    t.string "description"
    t.boolean "free_access"
    t.decimal "longitude", precision: 19, scale: 16
    t.decimal "latitude", precision: 19, scale: 16
    t.string "long_lat_type"
    t.decimal "x", precision: 19, scale: 2
    t.decimal "y", precision: 19, scale: 2
    t.string "projection_type"
    t.string "country_code"
    t.string "street_name"
    t.string "contained_in"
    t.index ["objectid"], name: "facilities_objectid_key", unique: true
  end

  create_table "facilities_features", id: false, force: :cascade do |t|
    t.bigint "facility_id"
    t.integer "choice_code"
  end

  create_table "flexible_service_properties", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id", limit: 255
    t.string "flexible_service_type", limit: 255
    t.boolean "cancellation_possible"
    t.boolean "change_of_time_possible"
    t.bigint "booking_arrangement_id"
    t.index ["objectid"], name: "flexible_service_propertiess_objectid_key", unique: true
  end

  create_table "footnote_alternative_texts", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.integer "object_version"
    t.datetime "creation_time"
    t.string "creator_id", limit: 255
    t.integer "footnote_id", null: false
    t.string "text"
    t.string "language"
    t.index ["objectid"], name: "footnote_alternative_texts_objectid_key", unique: true
  end

  create_table "footnotes", id: :serial, force: :cascade do |t|
    t.string "code"
    t.string "label"
    t.datetime "creation_time"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.string "creator_id"
    t.index ["objectid"], name: "footnotes_objectid_key", unique: true
  end

  create_table "footnotes_journey_patterns", id: false, force: :cascade do |t|
    t.bigint "journey_pattern_id"
    t.bigint "footnote_id"
    t.index ["footnote_id"], name: "footnotes_id_journey_patterns_id_idx"
    t.index ["journey_pattern_id"], name: "footnotes_journey_patterns_id_idx"
  end

  create_table "footnotes_lines", id: false, force: :cascade do |t|
    t.bigint "line_id"
    t.bigint "footnote_id"
    t.index ["footnote_id"], name: "footnotes_footnote_line_id_idx"
    t.index ["line_id"], name: "footnotes_line_id_idx"
  end

  create_table "footnotes_stop_points", id: false, force: :cascade do |t|
    t.bigint "stop_point_id"
    t.bigint "footnote_id"
    t.index ["footnote_id"], name: "footnotes_stop_point_id_idx"
    t.index ["stop_point_id"], name: "stop_point_id_idx"
  end

  create_table "footnotes_vehicle_journey_at_stops", id: false, force: :cascade do |t|
    t.bigint "vehicle_journey_at_stop_id"
    t.bigint "footnote_id"
    t.index ["footnote_id"], name: "footnotes_vehicle_journey_at_stop_id_idx"
    t.index ["vehicle_journey_at_stop_id"], name: "vehicle_journey_at_stop_id_idx"
  end

  create_table "footnotes_vehicle_journeys", id: false, force: :cascade do |t|
    t.bigint "vehicle_journey_id"
    t.bigint "footnote_id"
    t.index ["footnote_id"], name: "footnotes_vehicle_journeys_footnote_id_idx"
    t.index ["vehicle_journey_id"], name: "footnotes_vehicle_journeys_vehicle_journey_id_idx"
  end

  create_table "group_of_lines", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "comment"
    t.string "registration_number"
    t.index ["objectid"], name: "group_of_lines_objectid_key", unique: true
  end

  create_table "group_of_lines_lines", id: false, force: :cascade do |t|
    t.bigint "group_of_line_id"
    t.bigint "line_id"
  end

  create_table "interchanges", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.integer "priority"
    t.boolean "planned"
    t.boolean "guaranteed"
    t.boolean "advertised"
    t.time "maximum_wait_time"
    t.string "from_point"
    t.string "to_point"
    t.string "from_vehicle_journey"
    t.string "to_vehicle_journey"
    t.boolean "stay_seated"
    t.time "minimum_transfer_time"
    t.integer "from_visit_number"
    t.integer "to_visit_number"
    t.index ["from_point"], name: "interchanges_from_point_key"
    t.index ["from_vehicle_journey"], name: "interchanges_from_vehicle_journey_key"
    t.index ["objectid"], name: "interchanges_objectid_key", unique: true
    t.index ["to_point"], name: "interchanges_to_poinnt_key"
    t.index ["to_vehicle_journey"], name: "interchanges_to_vehicle_journey_idx"
  end

  create_table "journey_frequencies", id: :serial, force: :cascade do |t|
    t.bigint "vehicle_journey_id"
    t.time "scheduled_headway_interval", null: false
    t.time "first_departure_time", null: false
    t.time "last_departure_time"
    t.boolean "exact_time", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "timeband_id"
    t.index ["timeband_id"], name: "index_journey_frequencies_on_timeband_id"
    t.index ["vehicle_journey_id"], name: "index_journey_frequencies_on_vehicle_journey_id"
  end

  create_table "journey_pattern_sections", id: :serial, force: :cascade do |t|
    t.bigint "journey_pattern_id", null: false
    t.bigint "route_section_id", null: false
    t.integer "rank", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["journey_pattern_id", "route_section_id", "rank"], name: "index_jps_on_journey_pattern_id_and_route_section_id_and_rank", unique: true
    t.index ["journey_pattern_id"], name: "index_journey_pattern_sections_on_journey_pattern_id"
    t.index ["route_section_id"], name: "index_journey_pattern_sections_on_route_section_id"
  end

  create_table "journey_patterns", id: :serial, force: :cascade do |t|
    t.bigint "route_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "comment"
    t.string "registration_number"
    t.string "published_name"
    t.bigint "departure_stop_point_id"
    t.bigint "arrival_stop_point_id"
    t.integer "section_status", default: 0, null: false
    t.index ["objectid"], name: "journey_patterns_objectid_key", unique: true
  end

  create_table "journey_patterns_stop_points", id: false, force: :cascade do |t|
    t.bigint "journey_pattern_id"
    t.bigint "stop_point_id"
    t.index ["journey_pattern_id"], name: "index_journey_pattern_id_on_journey_patterns_stop_points"
  end

  create_table "lines", id: :serial, force: :cascade do |t|
    t.bigint "network_id"
    t.bigint "company_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "number"
    t.string "published_name"
    t.string "transport_mode_name"
    t.string "registration_number"
    t.string "comment"
    t.boolean "mobility_restricted_suitability"
    t.integer "int_user_needs"
    t.boolean "flexible_service"
    t.string "url"
    t.string "color", limit: 6
    t.string "text_color", limit: 6
    t.string "stable_id"
    t.string "transport_submode_name"
    t.string "flexible_line_type"
    t.bigint "booking_arrangement_id"
    t.index ["objectid"], name: "lines_objectid_key", unique: true
    t.index ["registration_number"], name: "lines_registration_number_key"
  end

  create_table "lines_key_values", id: false, force: :cascade do |t|
    t.bigint "line_id"
    t.string "type_of_key"
    t.string "key"
    t.string "value"
  end

  create_table "networks", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.date "version_date"
    t.string "description"
    t.string "name"
    t.string "registration_number"
    t.string "source_name"
    t.string "source_type"
    t.string "source_identifier"
    t.string "comment"
    t.bigint "company_id"
    t.index ["objectid"], name: "networks_objectid_key", unique: true
    t.index ["registration_number"], name: "networks_registration_number_key"
  end

  create_table "organisations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "data_format", default: "neptune"
  end

  create_table "pt_links", id: :serial, force: :cascade do |t|
    t.bigint "start_of_link_id"
    t.bigint "end_of_link_id"
    t.bigint "route_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "comment"
    t.decimal "link_distance", precision: 19, scale: 2
    t.index ["objectid"], name: "pt_links_objectid_key", unique: true
  end

  create_table "referential_last_update", id: :serial, force: :cascade do |t|
    t.datetime "last_update_timestamp"
  end

  create_table "referentials", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "prefix"
    t.string "projection_type"
    t.string "time_zone"
    t.string "bounds"
    t.bigint "organisation_id"
    t.text "geographical_bounds"
    t.bigint "user_id"
    t.string "user_name"
    t.string "data_format"
    t.index ["name", "organisation_id"], name: "index_referentials_on_name_and_organisation_id", unique: true
  end

  create_table "route_points", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id", limit: 255
    t.bigint "scheduled_stop_point_id"
    t.string "name"
    t.boolean "boarder_crossing"
    t.index ["objectid"], name: "route_points_objectid_key", unique: true
  end

  create_table "route_sections", id: :serial, force: :cascade do |t|
    t.geometry "input_geometry", limit: {:srid=>4326, :type=>"line_string"}
    t.geometry "processed_geometry", limit: {:srid=>4326, :type=>"line_string"}
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.float "distance"
    t.boolean "no_processing", default: false, null: false
    t.bigint "from_scheduled_stop_point_id"
    t.bigint "to_scheduled_stop_point_id"
    t.index ["objectid"], name: "route_sections_objectid_key", unique: true
  end

  create_table "routes", id: :serial, force: :cascade do |t|
    t.bigint "line_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "comment"
    t.bigint "opposite_route_id"
    t.string "published_name"
    t.string "number"
    t.string "direction"
    t.string "wayback"
    t.index ["objectid"], name: "routes_objectid_key", unique: true
  end

  create_table "routes_route_points", id: :serial, force: :cascade do |t|
    t.bigint "route_id", null: false
    t.bigint "route_point_id", null: false
    t.integer "position", null: false
    t.index ["route_id"], name: "routes_route_points_route_id_idx"
    t.index ["route_point_id"], name: "routes_route_points_route_point_id_idx"
  end

  create_table "routing_constraints_lines", id: false, force: :cascade do |t|
    t.bigint "line_id"
    t.string "stop_area_objectid_key"
    t.index ["stop_area_objectid_key"], name: "index_routing_constraints_lines_on_stop_area_objectid_key"
  end

  create_table "rule_parameter_sets", id: :serial, force: :cascade do |t|
    t.text "parameters"
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "organisation_id"
  end

  create_table "scheduled_stop_points", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.string "stop_area_objectid_key"
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id", limit: 255
    t.string "name"
    t.string "timing_point_status"
    t.index ["objectid"], name: "scheduled_stop_points_objectid_key", unique: true
    t.index ["stop_area_objectid_key"], name: "scheduled_stop_points_stop_area_idx"
  end

  create_table "stop_areas", id: :serial, force: :cascade do |t|
    t.bigint "parent_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.string "comment"
    t.string "area_type"
    t.string "registration_number"
    t.string "nearest_topic_name"
    t.integer "fare_code"
    t.decimal "longitude", precision: 19, scale: 16
    t.decimal "latitude", precision: 19, scale: 16
    t.string "long_lat_type"
    t.string "country_code"
    t.string "street_name"
    t.boolean "mobility_restricted_suitability"
    t.boolean "stairs_availability"
    t.boolean "lift_availability"
    t.integer "int_user_needs"
    t.string "zip_code"
    t.string "city_name"
    t.string "url"
    t.string "time_zone"
    t.integer "compass_bearing"
    t.string "stop_place_type"
    t.string "transport_mode"
    t.string "transport_sub_mode"
    t.index ["name"], name: "index_stop_areas_on_name"
    t.index ["objectid"], name: "stop_areas_objectid_key", unique: true
    t.index ["parent_id"], name: "index_stop_areas_on_parent_id"
    t.index ["stop_place_type"], name: "index_stop_areas_on_stop_place_type"
    t.index ["transport_mode"], name: "index_stop_areas_on_transport_mode"
    t.index ["transport_sub_mode"], name: "index_stop_areas_on_transport_sub_mode"
  end

  create_table "stop_areas_stop_areas", id: false, force: :cascade do |t|
    t.bigint "child_id"
    t.bigint "parent_id"
  end

  create_table "stop_points", id: :serial, force: :cascade do |t|
    t.bigint "route_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.integer "position"
    t.string "for_boarding"
    t.string "for_alighting"
    t.bigint "destination_display_id"
    t.bigint "scheduled_stop_point_id", null: false
    t.bigint "booking_arrangement_id"
    t.index ["objectid"], name: "stop_points_objectid_key", unique: true
    t.index ["route_id"], name: "stop_points_route_id_idx"
    t.index ["scheduled_stop_point_id"], name: "stop_points_scheduled_stop_point_id_idx"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "time_table_dates", force: :cascade do |t|
    t.bigint "time_table_id", null: false
    t.date "date"
    t.integer "position", null: false
    t.boolean "in_out"
    t.index ["time_table_id"], name: "index_time_table_dates_on_time_table_id"
  end

  create_table "time_table_periods", force: :cascade do |t|
    t.bigint "time_table_id", null: false
    t.date "period_start"
    t.date "period_end"
    t.integer "position", null: false
    t.index ["time_table_id"], name: "index_time_table_periods_on_time_table_id"
  end

  create_table "time_tables", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version", default: 1
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "version"
    t.string "comment"
    t.integer "int_day_types", default: 0
    t.date "start_date"
    t.date "end_date"
    t.index ["objectid"], name: "time_tables_objectid_key", unique: true
  end

  create_table "time_tables_blocks", primary_key: ["time_table_id", "block_id"], force: :cascade do |t|
    t.integer "block_id", null: false
    t.integer "time_table_id", null: false
    t.index ["block_id"], name: "time_tables_blocks_block_id_idx"
  end

  create_table "time_tables_dead_runs", primary_key: ["time_table_id", "dead_run_id"], force: :cascade do |t|
    t.integer "dead_run_id", null: false
    t.integer "time_table_id", null: false
    t.index ["dead_run_id"], name: "time_tables_dead_runs_dead_run_id_idx"
  end

  create_table "time_tables_vehicle_journeys", id: false, force: :cascade do |t|
    t.bigint "time_table_id"
    t.bigint "vehicle_journey_id"
    t.index ["time_table_id"], name: "index_time_tables_vehicle_journeys_on_time_table_id"
    t.index ["vehicle_journey_id"], name: "index_time_tables_vehicle_journeys_on_vehicle_journey_id"
  end

  create_table "timebands", id: :serial, force: :cascade do |t|
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "name"
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: ""
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "organisation_id"
    t.string "name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "authentication_token"
    t.string "invitation_token"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.bigint "invited_by_id"
    t.string "invited_by_type"
    t.datetime "invitation_created_at"
    t.integer "role", default: 1, null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_journey_at_stops", id: :serial, force: :cascade do |t|
    t.bigint "vehicle_journey_id"
    t.bigint "stop_point_id"
    t.string "connecting_service_id"
    t.string "boarding_alighting_possibility"
    t.time "arrival_time"
    t.time "departure_time"
    t.string "for_boarding"
    t.string "for_alighting"
    t.integer "arrival_day_offset", default: 0, null: false
    t.integer "departure_day_offset", default: 0, null: false
    t.string "objectid"
    t.bigint "object_version"
    t.string "creator_id"
    t.datetime "creation_time"
    t.index ["objectid"], name: "vehicle_journey_at_stops_objectid_key", unique: true
    t.index ["stop_point_id"], name: "index_vehicle_journey_at_stops_on_stop_pointid"
    t.index ["vehicle_journey_id"], name: "index_vehicle_journey_at_stops_on_vehicle_journey_id"
  end

  create_table "vehicle_journeys", id: :serial, force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "journey_pattern_id"
    t.bigint "company_id"
    t.string "objectid", null: false
    t.bigint "object_version"
    t.datetime "creation_time"
    t.string "creator_id"
    t.string "comment"
    t.string "status_value"
    t.string "transport_mode"
    t.string "published_journey_name"
    t.string "published_journey_identifier"
    t.string "facility"
    t.string "vehicle_type_identifier"
    t.bigint "number"
    t.boolean "mobility_restricted_suitability"
    t.boolean "flexible_service"
    t.integer "journey_category", default: 0, null: false
    t.string "transport_submode_name"
    t.string "private_code"
    t.string "service_alteration"
    t.bigint "flexible_service_properties_id"
    t.string "publication"
    t.index ["journey_pattern_id"], name: "vehicle_journeys_journey_pattern_id_idx"
    t.index ["objectid"], name: "vehicle_journeys_objectid_key", unique: true
    t.index ["route_id"], name: "index_vehicle_journeys_on_route_id"
  end

  create_table "vehicle_journeys_key_values", id: false, force: :cascade do |t|
    t.bigint "vehicle_journey_id"
    t.string "type_of_key"
    t.string "key"
    t.string "value"
    t.index ["vehicle_journey_id"], name: "vehicle_journeys_key_values_vehicle_journey_id_idx"
  end

  add_foreign_key "access_links", "access_points", name: "aclk_acpt_fkey", on_delete: :cascade
  add_foreign_key "access_links", "stop_areas", name: "aclk_area_fkey", on_delete: :cascade
  add_foreign_key "access_points", "stop_areas", name: "access_area_fkey", on_delete: :cascade
  add_foreign_key "blocks", "scheduled_stop_points", column: "end_point_id", name: "blocks_scheduled_stop_points_end_point_id_fkey"
  add_foreign_key "blocks", "scheduled_stop_points", column: "start_point_id", name: "blocks_scheduled_stop_points_start_point_id_fkey"
  add_foreign_key "blocks_dead_runs", "blocks", name: "blocks_dead_runs_block_id_fkey"
  add_foreign_key "blocks_dead_runs", "dead_runs", name: "blocks_dead_runs_dead_run_id_fkey"
  add_foreign_key "blocks_vehicle_journeys", "blocks", name: "blocks_vehicle_journeys_block_id_fkey"
  add_foreign_key "blocks_vehicle_journeys", "vehicle_journeys", name: "blocks_vehicle_journeys_vehicle_journey_id_fkey"
  add_foreign_key "booking_arrangements", "contact_structures", column: "booking_contact_id", name: "booking_arrangement_booking_contact_fkey"
  add_foreign_key "booking_arrangements_booking_methods", "booking_arrangements", name: "booking_arrangements_booking_methods_lines_fkey"
  add_foreign_key "booking_arrangements_buy_when", "booking_arrangements", name: "booking_arrangement_buy_when_lines_fkey"
  add_foreign_key "connection_links", "stop_areas", column: "arrival_id", name: "colk_endarea_fkey", on_delete: :cascade
  add_foreign_key "connection_links", "stop_areas", column: "departure_id", name: "colk_startarea_fkey", on_delete: :cascade
  add_foreign_key "dated_service_journey_refs", "dated_service_journeys", column: "derived_dsj_id", name: "dated_service_journey_refs_derived_dsj_id_fkey"
  add_foreign_key "dated_service_journey_refs", "dated_service_journeys", column: "original_dsj_id", name: "dated_service_journey_refs_original_dsj_id_fkey"
  add_foreign_key "dated_service_journeys", "vehicle_journeys", name: "dated_service_journeys_vehicle_journey_id_fkey"
  add_foreign_key "dead_run_at_stops", "dead_runs", name: "dead_run_at_stops_dead_runs_id_fkey"
  add_foreign_key "dead_run_at_stops", "stop_points", name: "dead_run_at_stops_stop_point_id_fkey"
  add_foreign_key "dead_runs", "journey_patterns", name: "dead_runs_journey_patterns_id_fkey"
  add_foreign_key "flexible_service_properties", "booking_arrangements", name: "flexible_props_booking_arrangement_fkey"
  add_foreign_key "footnote_alternative_texts", "footnotes", name: "footnotes_footnote_alternative_texts_fkey"
  add_foreign_key "footnotes_journey_patterns", "footnotes", name: "footnotes_journey_patterns_footnotes_fkey", on_delete: :cascade
  add_foreign_key "footnotes_journey_patterns", "journey_patterns", name: "footnotes_journey_patterns_journey_patterns_fkey", on_delete: :cascade
  add_foreign_key "footnotes_lines", "footnotes", name: "footnotes_lines_footnotes_fkey", on_delete: :cascade
  add_foreign_key "footnotes_lines", "lines", name: "footnotes_lines_lines_fkey", on_delete: :cascade
  add_foreign_key "footnotes_stop_points", "footnotes", name: "footnotes_stop_points_footnotes_fkey", on_delete: :cascade
  add_foreign_key "footnotes_stop_points", "stop_points", name: "footnotes_stop_points_stop_points_fkey", on_delete: :cascade
  add_foreign_key "footnotes_vehicle_journey_at_stops", "footnotes", name: "footnotes_vehicle_journey_at_stops_footnotes_fkey", on_delete: :cascade
  add_foreign_key "footnotes_vehicle_journey_at_stops", "vehicle_journey_at_stops", name: "footnotes_vehicle_journey_at_stops_vjas_fkey", on_delete: :cascade
  add_foreign_key "footnotes_vehicle_journeys", "footnotes", name: "footnotes_vehicle_journeys_footnotes_fkey", on_delete: :cascade
  add_foreign_key "footnotes_vehicle_journeys", "vehicle_journeys", name: "footnotes_vehicle_journeys_vehicle_journeys_fkey", on_delete: :cascade
  add_foreign_key "group_of_lines_lines", "group_of_lines", name: "groupofline_group_fkey", on_delete: :cascade
  add_foreign_key "group_of_lines_lines", "lines", name: "groupofline_line_fkey", on_delete: :cascade
  add_foreign_key "journey_frequencies", "timebands"
  add_foreign_key "journey_frequencies", "vehicle_journeys"
  add_foreign_key "journey_pattern_sections", "journey_patterns", on_delete: :cascade
  add_foreign_key "journey_pattern_sections", "route_sections"
  add_foreign_key "journey_patterns", "routes", name: "jp_route_fkey", on_delete: :cascade
  add_foreign_key "journey_patterns", "stop_points", column: "arrival_stop_point_id", name: "arrival_point_fkey", on_delete: :nullify
  add_foreign_key "journey_patterns", "stop_points", column: "departure_stop_point_id", name: "departure_point_fkey", on_delete: :nullify
  add_foreign_key "journey_patterns_stop_points", "journey_patterns", name: "jpsp_jp_fkey", on_delete: :cascade
  add_foreign_key "journey_patterns_stop_points", "stop_points", name: "jpsp_stoppoint_fkey", on_delete: :cascade
  add_foreign_key "lines", "booking_arrangements", name: "lines_booking_arrangement_fkey"
  add_foreign_key "lines", "companies", name: "line_company_fkey", on_delete: :nullify
  add_foreign_key "lines", "networks", name: "line_ptnetwork_fkey", on_delete: :nullify
  add_foreign_key "lines_key_values", "lines", name: "lines_key_values_lines_fkey", on_delete: :cascade
  add_foreign_key "networks", "companies", name: "network_company_fkey", on_delete: :nullify
  add_foreign_key "route_points", "scheduled_stop_points"
  add_foreign_key "routes", "lines", name: "route_line_fkey", on_delete: :cascade
  add_foreign_key "routes", "routes", column: "opposite_route_id", name: "route_opposite_route_fkey", on_delete: :nullify
  add_foreign_key "routes_route_points", "route_points"
  add_foreign_key "routes_route_points", "routes", on_delete: :cascade
  add_foreign_key "routing_constraints_lines", "lines", name: "routingconstraint_line_fkey", on_delete: :cascade
  add_foreign_key "stop_areas", "stop_areas", column: "parent_id", name: "area_parent_fkey", on_delete: :nullify
  add_foreign_key "stop_areas_stop_areas", "stop_areas", column: "child_id", name: "stoparea_child_fkey", on_delete: :cascade
  add_foreign_key "stop_areas_stop_areas", "stop_areas", column: "parent_id", name: "stoparea_parent_fkey", on_delete: :cascade
  add_foreign_key "stop_points", "booking_arrangements", name: "stop_points_booking_arrangement_fkey"
  add_foreign_key "stop_points", "destination_displays", name: "stop_point_destination_display_fkey"
  add_foreign_key "stop_points", "routes", name: "stoppoint_route_fkey", on_delete: :cascade
  add_foreign_key "stop_points", "scheduled_stop_points"
  add_foreign_key "time_table_dates", "time_tables", name: "tm_date_fkey", on_delete: :cascade
  add_foreign_key "time_table_periods", "time_tables", name: "tm_period_fkey", on_delete: :cascade
  add_foreign_key "time_tables_blocks", "blocks", name: "time_tables_blocks_block_id_fkey"
  add_foreign_key "time_tables_blocks", "time_tables", name: "time_tables_blocks_time_table_id_fkey"
  add_foreign_key "time_tables_dead_runs", "dead_runs", name: "time_tables_dead_runs_dead_run_id_fkey"
  add_foreign_key "time_tables_dead_runs", "time_tables", name: "time_tables_dead_runs_time_table_id_fkey"
  add_foreign_key "time_tables_vehicle_journeys", "time_tables", name: "vjtm_tm_fkey", on_delete: :cascade
  add_foreign_key "time_tables_vehicle_journeys", "vehicle_journeys", name: "vjtm_vj_fkey", on_delete: :cascade
  add_foreign_key "vehicle_journey_at_stops", "stop_points", name: "vjas_sp_fkey", on_delete: :cascade
  add_foreign_key "vehicle_journey_at_stops", "vehicle_journeys", name: "vjas_vj_fkey", on_delete: :cascade
  add_foreign_key "vehicle_journeys", "companies", name: "vj_company_fkey", on_delete: :nullify
  add_foreign_key "vehicle_journeys", "flexible_service_properties", column: "flexible_service_properties_id", name: "vehicle_journeys_flexible_props_fkey"
  add_foreign_key "vehicle_journeys", "journey_patterns", name: "vj_jp_fkey", on_delete: :cascade
  add_foreign_key "vehicle_journeys", "routes", name: "vj_route_fkey", on_delete: :cascade
  add_foreign_key "vehicle_journeys_key_values", "vehicle_journeys", name: "vehicle_journeys_key_values_vehicle_journey_fkey", on_delete: :cascade
end
