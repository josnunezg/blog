class Tokenizer
  ALGORITHM = 'HS256'.freeze
  SECRET = Rails.application.credentials.jwt_secret

  class << self
    def encode(payload)
      JWT.encode(payload, SECRET, ALGORITHM)
    end

    def decode(token)
      JWT.decode(token, SECRET, true, { algorithm: ALGORITHM })
         .first
         .with_indifferent_access
    rescue StandardError
      {}
    end
  end
end
