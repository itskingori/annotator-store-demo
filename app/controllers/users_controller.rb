class UsersController < ApplicationController
  # Callbacks
  protect_from_forgery with: :null_session, only: [:me]
  before_action :authenticate_user!

  def me
  end
end
