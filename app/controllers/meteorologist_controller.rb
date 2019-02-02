require 'open-uri'

class MeteorologistController < ApplicationController
  def street_to_weather
    @street_address = params.fetch("user_street_address")
    sanitized_street_address = URI.encode(@street_address)

    # ==========================================================================
    # Your code goes below.
    # The street address the user input is in the string @street_address.
    # A sanitized version of the street address, with spaces and other illegal
    #   characters removed, is in the string sanitized_street_address.
    # ==========================================================================

    url = "https://maps.googleapis.com/maps/api/geocode/json?address="+ sanitized_street_address +"&key=AIzaSyBr-0XDfztIIUGyPRfa1D5KfPvURvAk2e4"
    parsed_data = JSON.parse(open(url).read)
    latitude = parsed_data.dig("results", 0, "geometry", "location", "lat")
    longitude = parsed_data.dig("results", 0, "geometry", "location", "lng")
    
    @current_temperature = "Replace this string with your answer"

    @current_summary = "Replace this string with your answer"

    @summary_of_next_sixty_minutes = "Replace this string with your answer"

    @summary_of_next_several_hours = "Replace this string with your answer"

    @summary_of_next_several_days = "Replace this string with your answer"

    render("meteorologist_templates/street_to_weather.html.erb")
  end

  def street_to_weather_form
    render("meteorologist_templates/street_to_weather_form.html.erb")
  end
end
