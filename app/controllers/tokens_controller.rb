class TokensController < ApplicationController
  # Callbacks
  protect_from_forgery with: :null_session, only: [:fetch]
  before_action :authenticate_user!

  # Constants
  CONSUMER_KEY    = '<BLEEK_LLOYD_CONSUMER_KEY_EXAMPLE>'
  CONSUMER_SECRET = '<BLEEK_LLOYD_CONSUMER_SECRET_EXAMPLE>'

  def fetch
    token = nil
    if current_user.present? && current_user.id
      token = generate_token current_user.id
      render text: token
    else
      render text: 'User not found', status: :not_found
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
