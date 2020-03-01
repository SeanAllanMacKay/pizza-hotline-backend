class UsersController < ApplicationController
    def create
        user = User.new(
            email: params[:email],
            password: params[:password],
            first_name: params[:first_name],
            last_name: params[:last_name],
            phone_number: params[:phone_number],
            recieve_promos: params[:recieve_promos]
        )

        if user.save
            render json: { success: true }, status: 200
        else
            render json: { success: false, error: 'There was an error creating your account' }, status: 500
        end
    end
end
