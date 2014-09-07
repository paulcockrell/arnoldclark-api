module Api
  module V1
    class ImagesController < ApplicationController
      rescue_from Exception, with: :server_error
      before_filter :validate_params

      def index
        @images = ImageManager.find(params[:registration], params[:stock_reference])

        render :json => @images
      end


      protected

      def validate_params
        unless (ImageManager::REQUIRED_PARAMS - params.symbolize_keys.keys).count.zero?
          raise "Missing parameters"
        end
      end
    end
  end
end
