class Api::V1::EventsController < ApplicationController

    before_action :find_event, only: [:update]

    def index
        @events = Event.all
        @events_with_guests = @events.map{ |event| 
            {
             host: event.user_id,
             guests: event.users,
             title: event.title,
             datetime: event.datetime,
             latitude: event.latitude,
             longitude: event.longitude,
             capacity: event.capacity,
             icon: event.icon
            }
        }

        render json: @events_with_guests
    end

    def show
        @event = Event.find(params[:id])

        @event_with_guests =  
            {
             host: @event.user_id,
             guests: @event.users,
             title: @event.title,
             datetime: @event.datetime,
             latitude: @event.latitude,
             longitude: @event.longitude,
             capacity: @event.capacity,
             icon: @event.icon
            }
        
        
        render json: @event_with_guests
    end

    def update
        @event.update(event_params)
        if @event.save
        render json: @event, status: :accepted
        else
        render json: { errors: @event.errors.full_messages }, status: :unprocessible_entity
        end
    end

    def create
        @event = Event.create(event_params)
        if @event 
            render json: @event
        else
            render json: 'Please, fill all required fields.'
        end
    end

    def destroy
        @event.delete
        head :no_content
    end

    private

    def event_params
        params.permit(:title, :date, :latitude, :longtitude, :capacity, :user_id)
    end

    def find_event
        @event = Event.find(params[:id])
    end

end
