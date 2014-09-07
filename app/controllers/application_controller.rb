class ApplicationController < ActionController::API
  include ActionController::Serialization

  private

  def server_error(exception)
    render :json => {:success => false}, :status => 404
  end
end
