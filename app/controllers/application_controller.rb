class ApplicationController < ActionController::API
  include ActionController::Serialization

  class MissingParameters < StandardError; end

  private

  def failure
    render :json => {:success => false}
  end
end
