class ApplicationController < ActionController::API
  include ActionController::Serialization

  private

  def failure(exception)
    render :json => {:success => false, :error => exception.errors.messages}
  end
end
