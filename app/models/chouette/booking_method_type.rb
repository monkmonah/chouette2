class Chouette::BookingMethodType < ActiveSupport::StringInquirer

  def initialize(text_code, numerical_code)
    super text_code.to_s
    @numerical_code = numerical_code
  end

  def self.new(text_code, numerical_code = nil)
    if text_code and numerical_code
      super
    elsif self === text_code
      text_code
    else
      if Integer === text_code
        text_code, numerical_code = definitions.rassoc(text_code)
      else
        text_code, numerical_code = definitions.assoc(text_code.to_s)
      end

      super text_code, numerical_code
    end
  end

  def to_i
    @numerical_code
  end

  def inspect
    "#{to_s}/#{to_i}"
  end

  def name
    camelize
  end

  @@definitions = [
#      ["other",0],
      ["callDriver",1],
      ["callOffice",2],
      ["online",3],
      ["phoneAtStop",4],
      ["text",5],
 #     ["none",6]

  ]
  cattr_reader :definitions

  @@all = nil
  def self.all
    @@all ||= definitions.collect do |text_code, numerical_code|
      new(text_code, numerical_code)
    end
  end

end
