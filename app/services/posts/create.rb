module Posts
  class CreateService
    include Interactor

    delegate :params, :user, to: :context

    def call
      post = user.posts.new(params)
      context.fail!(error: Error.record_invalid(post)) unless post.save

      context.post = post
    end
  end
end
