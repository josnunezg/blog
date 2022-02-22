module Api
  module V1
    class PostsController < ApplicationController
      skip_before_action :user_authenticate!, only: :index
      before_action :set_post, only: %i[show update destroy]

      def index
        render json: Post.all, each_serializer: Posts::PreviewSerializer
      end

      def create
        service = Posts::CreateService.call(params: post_params, user: current_user)

        if service.success?
          render json: service.post, serializer: Posts::PreviewSerializer, status: :created
        else
          render json: service.error, status: :unprocess_entity
        end
      end

      def show
        render json: @post, status: :ok
      end

      def update
        service = Posts::UpdateService.call(params: post_params, user: current_user, post: @post)

        if service.success?
          render json: service.post, status: :ok
        else
          render json: service.error, status: Error.status(service.error[:error])
        end
      end

      def destroy
        service = Posts::DeleteService.call(post: @post, user: current_user)

        if service.success?
          head :ok
        else
          render json: service.error, status: :unauthorized
        end
      end

      private

      def post_params
        params.require(:post).permit(:title, :body)
      end

      def set_post
        @post = Post.find(id: params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: Error.record_not_found('Post', params[:id]), status: :not_found
      end
    end
  end
end
