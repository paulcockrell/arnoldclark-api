module Api
  module V1
    class ImagesController < ApplicationController
      rescue_from MissingParameters, RestClient::ResourceNotFound, :with => :failure

      def index
        @images = ImageManager.find(*image_manager_params)

        render json: @images
      end

      protected

      def image_manager_params
        raise MissingParameters unless params.has_key?(:registration) && params.has_key?(:stock_reference)

        [params[:registration].to_s, params[:stock_reference].to_s]
      end
    end
  end
end
