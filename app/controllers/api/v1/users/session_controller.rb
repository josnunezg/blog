module Api
  module V1
    module Users
      class SessionController < ApplicationController
        skip_before_action :user_authenticate!

        def create
          service = Users::LoginService.call(email: email, password: password)

          if service.success?
            response.headers['Authorization'] = service.token
            head :created
          else
            render json: response.error, status: :unauthorized
          end
        end

        private

        def email
          params[:email]
        end

        def password
          params[:password]
        end
      end
    end
  end
end

