class MaintenanceItemsController < ApplicationController

    def index
        @maintenance_items = MaintenanceItem.all
        render :index
    end 

    def create
        @maintenance_item = MaintenanceItem.new(maintenance_item_params)
        @maintenance_item.user_id = current_user.id
        @maintenance_item.vehicle_id = params[:vehicle_id]
        if @maintenance_item.save
            redirect_to vehicle_url(params[:vehicle_id])
        else
            flash.now[:errors] = @maintenance_item.errors.full_messages
            render :new
        end 
    end     

    def edit
        @maintenance_item = MaintenanceItem.find(params[:id])
        @vehicle_id = @maintenance_item.vehicle_id
        render :edit
    end 

    def update
        @maintenance_item = MaintenanceItem.find(params[:id])
        vehicle_id = @maintenance_item.vehicle_id
        if @maintenance_item.update(maintenance_item_params)
            redirect_to vehicle_url(vehicle_id)
        else 
            flash.now[:errors] = @maintenance_item.errors.full_messages
            render :edit
        end     
    end 

    def destroy
        maintenance_item = MaintenanceItem.find(params[:id])
        vehicle_id = maintenance_item.vehicle_id
        maintenance_item.destroy
        redirect_to vehicle_url(vehicle_id)
    end 

    private
    def maintenance_item_params
        params.require(:maintenance_item).permit(:title, :date_preformed, :comment, :current_mileage, :cost)
    end 

end 