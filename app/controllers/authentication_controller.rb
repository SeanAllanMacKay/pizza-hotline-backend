class AuthenticationController < ApplicationController
    skip_before_action :authorized, only: [:login]

    def login
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            token = encode_token(user_id: user.id)
            time = Time.now + 24.hours.to_i

            render json: { success: true, token: { token: token, exp: time.strftime("%m-%d-%Y %H:%M") }, user: { email: user.email, first_name: user.first_name, last_name: user.last_name }}, status: 200
        else
            render json: { success: false, error: 'Username or Password invalid' }, status: :unauthorized
        end
    end
end
