module Users
  class CreateService
    include Interactor

    delegate :params, to: :context

    def call
      user = User.new(params)
      context.fail!(error: Error.record_invalid(user)) unless user.save

      context.user = user
    end
  end
end
