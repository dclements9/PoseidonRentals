class EquipmentController < ApplicationController
    before_action :is_admin?, only: [:edit, :update, :new, :create, :destroy]
    before_action :find_equipment, only: [:update, :edit, :destroy, :show]
    
    def index
        @equipment = Equipment.all
    end

    def show
    end

    def edit
    end

    def update
        @equipment.update(equipment_params)
        
        redirect_to equipment_path(@equipment)
    end

    def new
        @equipment = Equipment.new
    end

    def create
        @equipment = Equipment.new(equipment_params)
                
        if @equipment.save
            redirect_to equipment_path(@equipment)
        else
            render :new
        end
    end

    def destroy
        @equipment.destroy

        redirect_to equipment_index_path
    end

    private

    def equipment_params
        params.require(:equipment).permit(:name, :category, :available, :cost)
    end

    def is_admin?
        redirect_to equipment_index_path unless current_user.admin?
    end

    def find_equipment
        @equipment = Equipment.find(params[:id])
    end
end
