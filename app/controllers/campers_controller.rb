class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers, status: :ok
    end

    def show
        camper = camper_find
        render json: camper, status: :ok, serializer: CamperWithActivitySerializer
    end

    def create
        camper = Camper.create!(camper_param)
        render json: camper, status: :created 
    end

    private

    def camper_param
        params.permit(:name, :age)
    end

    def camper_find
        Camper.find_by!(id: params[:id])
    end
end
