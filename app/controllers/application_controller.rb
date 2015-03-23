class ApplicationController < ActionController::Base
  # Callbacks
  before_action :redirect_to_apex_domain if Rails.env.production?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  # Redirects to the apex domain depending on the criteria
  #
  # Check the domain maps all unmatched to blannotator.kingori.co. Since this method is
  # only run on production - this should be the only domain that shows the app.
  def redirect_to_apex_domain
    domain_to_redirect_to = 'blannotator.kingori.co'
    domain_exceptions = [domain_to_redirect_to]
    should_redirect = !(domain_exceptions.include? request.host)
    domain_protocol = request.protocol
    new_url = "#{domain_protocol}#{domain_to_redirect_to}#{request.fullpath}"
    redirect_to new_url, status: :moved_permanently if should_redirect
  end
end
