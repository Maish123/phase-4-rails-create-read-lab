class PlantsController < ApplicationController
    ##the GET method(index)

    def index
        plants = Plant.all
        render json: plants
    end

    ## theGET METHOD WITH THE ID

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, status: :created
        else
            render json: {error: "Plant cannot be found"}, status: :not_found
        end
    end

    ##THE POST METHOD
    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private
    def plant_params
        params.permit(:name, :image, :price)
    end
end
