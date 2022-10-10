class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        gyms = Gym.all 
        render json: gyms
    end

    def show
        gyms = Gym.find(params[:id])
        render json: gyms
    end

    private

    def render_not_found_response
        render json: { error: "Gym not found" }, status: :not_found
    end
end
