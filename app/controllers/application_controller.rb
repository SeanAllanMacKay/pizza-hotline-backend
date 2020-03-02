class ApplicationController < ActionController::API
    before_action :authorized

    SECRET_KEY = ENV['SECRET']

    def authorized
        render json: { message: 'Please log in' },
           status: :unauthorized unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def current_user
        if decoded_token()
           user_id = decoded_token[0]['user_id']
           @user = User.find_by(id: user_id)
        end
    end

    def encode_token(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, SECRET_KEY)
    end

    def decode_token(token)
        JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
    end

    def decoded_token
        if auth_header
           token = auth_header
           begin
                decode_token(token)
           rescue JWT::DecodeError
                nil
           end
        end
    end

    def auth_header
        request.headers['Authorization']
    end
end
