module Posts
  class DeleteService
    include Interactor

    delegate :params, :user, :post, to: :context

    def call
      context.fail!(error: Error.unauthorized) if user.cannot?(post, :destroy) || !post.destroy
    end
  end
end
