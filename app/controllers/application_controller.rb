class ApplicationController < ActionController::API
    # before_action :authenticate_user!
    respond_to :json
    include ActionController::MimeResponds
    include Pundit::Authorization
end
