class Api::V1::UsersController < ApplicationController

    before_action :find_user, only: [:update]

    def index
        @users = User.all
        render json: User.includes(:events), include: ['events']
    end

    def show
        @user = User.find(params[:id])
        render json: {user_details: @user,
        joined_events: @user.events,
        hosted_events: Event.where(user_id: @user.id)                    
        }
    end

    def update
        @user.update(user_params)
        if @user.save
         render json: @user, status: :accepted
        else
         render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
        end
    end

    private

    def user_params
        params.permit(:email, :password_digest)
    end

    def find_user
        @user = User.find(params[:id])
    end

end
