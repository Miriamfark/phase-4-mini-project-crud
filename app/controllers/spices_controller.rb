class SpicesController < ApplicationController

    def index 
        render json: Spice.all
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice
    end

    def update 
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    def destroy 
        spice = find_spice
        spice.destroy
        head :no_content
    end 

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

end
