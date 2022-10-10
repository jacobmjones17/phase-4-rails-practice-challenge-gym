class MembershipsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        memberships = Membership.all 
        render json: memberships
    end

    def show
        memberships = Membership.find(params[:id])
        render json: memberships
    end

    private

    def render_not_found_response
        render json: { error: "Membership not found" }, status: :not_found
    end
end
