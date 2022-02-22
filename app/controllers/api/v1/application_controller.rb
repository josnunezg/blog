module Api
  module V1
    class ApplicationController < ::ApplicationController
      before_action :user_authenticate!

      helper_method :current_user, :logged_in?

      private

      def current_user
        @current_user ||= User.find_by(id: token_data[:id])
      end

      def token
        request.headers['Authorization']
      end

      def token_data
        @token_data ||= Tokenizer.decode(token)
      end

      def logged_in?
        current_user.present?
      end

      def user_authenticate!
        render json: Error.unauthorized, status: :unauthorized unless logged_in?
      end
    end
  end
end
