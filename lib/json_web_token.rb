class JsonWebToken
    SECRET_KEY = ENV['SECRET']

    def self.encode(payload, exp = 24.hours.from_now)
        payload[:exp] = exp.to_i
        JWT.encode(payload, 'secret')
    end

    def self.decode(token)
        decoded = JWT.decode(token, 'secret', true, algorithm: 'HS256')[0]
        HashWithIndifferentAccess.new decoded
    end
end