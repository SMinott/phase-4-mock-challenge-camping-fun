class ActivitiesController < ApplicationController

    def index
        acts =  Activity.all
        render json: acts, status: :ok
    end

    def destroy
        activity = activity_find
       
        activity.destroy
        head :no_content
    end

    private

    # def activity_params
    #     params.permit(:name, :difficulty)
    # end

    def activity_find
        Activity.find_by!(id: params[:id])
    end

end
