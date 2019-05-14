class VehiclesController < ApplicationController

    def new
        render :new
    end 

    def create
        @vehicle = Vehicle.new(vehicle_params)
        @vehicle.user_id = current_user.id

        if @vehicle.save
            redirect_to vehicles_url
        else
            flash.now[:errors] = @vehicle.errors.full_messages
        end 
    end 

    def index
        @vehicles = Vehicle.where(user_id: current_user.id)
        render :index
    end
    
    def show
        @vehicle = Vehicle.find(params[:id])
        render :show
    end 

    def edit 
        @vehicle = Vehicle.find(params[:id])
        render :edit
    end 

    def update
        @vehicle = Vehicle.find(params[:id])
        if @vehicle.update(vehicle_params)
            redirect_to vehicles_url
        else 
            flash.now[:errors] = @vehicle.errors.full_messages
            render :edit
        end 
    end 

    def destroy
        vehicle = Vehicle.find(params[:id]);
        vehicle.destroy 
        redirect_to vehicles_url
    end 

    private
    def vehicle_params
        params.require(:vehicle).permit(:year, :make, :model, :vin, :mileage, :cost)
    end 


end 