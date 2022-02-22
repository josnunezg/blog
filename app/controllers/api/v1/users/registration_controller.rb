module Api
  module V1
    class RegistrationController < ApplicationController
      skip_before_action :user_authenticate!

      def create
        service = ::Users::CreateService.call(params: create_params)

        if service.success?
          head :created
        else
          render json: service.error, status: :unprocess_entity
        end
      end

      private

      def create_params
        params.require(:user)
              .permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
    end
  end
end
