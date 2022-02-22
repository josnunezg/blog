module Posts
  class UpdateService
    include Interactor

    delegate :params, :user, :post, to: :context

    def call
      context.fail!(error: Error.unauthorized) if user.cannot?(post, :update)
      context.fail!(error: Error.record_invalid) unless post.update(params)

      context.post = post
    end
  end
end
