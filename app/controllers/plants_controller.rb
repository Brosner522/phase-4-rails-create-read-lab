class PlantsController < ApplicationController

    #Get all plants
    def index 
        plants = Plant.all 
        render json: plants, only: [:id, :name, :image, :price]
    end

    #GET specific plant
    def show
        plant = Plant.find_by(id: params[:id])
        render json: plant, only: [:id, :name, :image, :price]
    end

    #POST
    def create 
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    def plant_params
        params.permit(:name, :image, :price)
    end
end