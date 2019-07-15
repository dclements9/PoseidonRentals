class EquipmentController < ApplicationController

    def index
        @equipment = Equipment.all
    end

    def show
        @equipment = Equipment.find(params[:id])
    end
end
