class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

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
            payload = { user_id: user[:id] }
            token = encode_token(payload)
            render json: { success: true, token: token }, status: 200
        else
            render json: { success: false, error: 'There was an error creating your account' }, status: 500
        end
    end

    def get
        render json: { success: true, user: { email: @user.email, first_name: @user.first_name, last_name: @user.last_name, phone_number: @user.phone_number } }, status: 200
    end
end
