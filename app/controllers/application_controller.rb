class ApplicationController < ActionController::Base
    before_action :authorized

   def authorized
      render json: { message: 'Token as invalid, loggin again!' }, 
         status: :unauthorized unless logged_in?
   end
   def logged_in?
      !!current_user
   end
   def current_user
      if decoded_token()
         owner_id = decoded_token[0]['owner_id']
         @owner = Owner.find_by(id: owner_id)
      end
   end
   def decoded_token
      if auth_header()
         token = auth_header.split(' ')[1]
         begin
            JWT.decode(token, Rails.application.credentials.secret_key_base, true, 
               algorithm: 'HS256')
         rescue JWT::DecodeError
            nil
         end
      end
   end
   def auth_header
      request.headers['Authorization']
   end
   def encode_token(payload)
      payload[:exp] = Time.now.to_i + 86400
      JWT.encode(payload, Rails.application.credentials.secret_key_base)
   end
end
