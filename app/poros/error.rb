class Error
  RECORD_NOT_FOUND = 'RECORD_NOT_FOUND'.freeze
  USER_OR_PASSWORD_INVALID = 'USER_OR_PASSWORD_INVALID'.freeze
  RECORD_INVALID = 'RECORD_INVALID'.freeze
  UNAUTHORIZED = 'UNAUTHORIZED'.freeze

  attr_reader :error, :code, :message

  def initialize(error, code, message)
    @error = error
    @code = code
    @message = message
  end

  def as_json
    {
      error: error,
      code: code,
      message: message
    }
  end

  class << self
    def status(error)
      {
        RECORD_NOT_FOUND => :not_found,
        USER_OR_PASSWORD_INVALID => :unauthorized,
        RECORD_INVALID => :unprocess_entity,
        UNAUTHORIZED => :unauthorized
      }[error]
    end

    def record_not_found(model, id)
      new(
        'RECORD_NOT_FOUND',
        1001,
        "#{model} with ##{id} not found"
      ).as_json
    end

    def user_or_password_invalid
      new(
        'USER_OR_PASSWORD_INVALID',
        1002,
        'user and/or email are invalid'
      ).as_json
    end

    def record_invalid(record)
      new(
        'RECORD_INVALID',
        1003,
        record.errors.full_messages
      )
    end

    def unauthorized
      new(
        'UNAUTHORIZED',
        1004,
        'you are not authorized to get the data'
      ).as_json
    end
  end
end
