module Users
  class LoginService
    include Interactor

    delegate :email, :password, to: :context

    def call
      context.fail!(error: Error.user_or_password_invalid) if user.nil?
      context.fail!(error: Error.user_or_password_invalid) unless user.authenticate(password)

      context.token = Tokenizer.encode(payload)
    end

    private

    def user
      @user ||= User.find_by(email: email)
    end

    def payload
      {
        id: user.id,
        email: user.email
      }
    end
  end
end
