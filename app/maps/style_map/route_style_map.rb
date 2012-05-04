class StyleMap::RouteStyleMap < StyleMap::GenericStyleMap
  attr_accessor :style

  def initialize(options = {})
    @style = options[:style].present? ? default_style.merge(options[:style]) : default_style
  end

  def default_style
    {
      :label => "${label}",
      :fontColor => "black", 
      :fontSize => "11px",
      :fontWeight => "bold",
      :labelAlign => "ct",
      :labelXOffset => 0,
      :labelYOffset => -15,
      :strokeColor => "#000000",
      :strokeOpacity => 1,
      :strokeWidth => 3,
      :strokeLineCap => "round",
      :strokeDashstyle => "solid",
      :externalGraphic => "/assets/map/${positionType}.png",
      :graphicWidth => 12,
      :graphicHeight => 12, 
      :graphicOpacity => 1,	
      :graphicXOffset => -6,
      :graphicYOffset => -6,
      :display => true
    }
  end

  def context
    context = { 
      :label => :" function(feature) {if(feature.layer.map.getZoom() > 13) { return feature.attributes.name;} else {return '';}} ", 
      :positionType => :" function(feature) { if (feature.attributes.departure != undefined) { return 'departure'; } else if (feature.attributes.arrival != undefined) { return 'arrival'; } else { return 'interstop'; }} " 
    }
  end

  def style_map
    OpenLayers::StyleMap.new(:default => OpenLayers::Style.new(style, { :context => context}))
  end

end

