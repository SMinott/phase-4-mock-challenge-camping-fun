class SignupsController < ApplicationController
    
    def create
        new_signup = Signup.create!(signup_params)
        #They specifically want the associated activity returned for the new signup
        render json: new_signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end
end
