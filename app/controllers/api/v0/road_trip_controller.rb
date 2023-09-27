class Api::V0::RoadTripController < ApplicationController
  before_action :authenticate_user

  def create
    road_trip = RoadTripFacade.create_road_trip(params[:origin], params[:destination])

    if road_trip
      render json: { data: road_trip }, status: :created
    else
      render json: { error: 'Unable to create a road trip' }, status: :unprocessable_entity
    end
  end
  
  private
  
  def authenticate_user
    key = params[:api_key]
    user = User.find_by(api_key: key)
    # require 'pry'; binding.pry
    unless user
      Rails.logger.warn("No user found for API key: #{key}")
      render json: { error: 'Invalid API key' }, status: :unauthorized
    end
  end
end
