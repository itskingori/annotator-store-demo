class TokensController < ApplicationController
  # Replace these with your details
  CONSUMER_KEY    = '<BLEEK_LLOYD_CONSUMER_KEY>'
  CONSUMER_SECRET = '<BLEEK_LLOYD_CONSUMER_SECRET>'

  def fetch
    user = User.find_by id: 1
    token = nil
    if user.present?
      token = generate_token user.id
      render text: token
    else
      render text: nil, status: :not_found
    end
  end

  private

  # Generate JWT string
  def generate_token(user_id)
    payload = {
      consumerKey: CONSUMER_KEY,
      userId: user_id,
      issuedAt: Time.current.utc.iso8601,
      ttl: 86400
    }
    JWT.encode(payload, CONSUMER_SECRET)
  end
end
