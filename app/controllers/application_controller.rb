class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception  
  before_action :set_properties

  include Gatekeeper::RequiresAuthentication
  include Gatekeeper::ProvidesCurrentUser

  before_action { authenticate! }

  def set_properties
    @activate_repository = false
    @body_class = "default"
    @page_title = ""
  end
end

