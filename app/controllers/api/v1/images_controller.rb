module Api
  module V1
    class ImagesController < ApplicationController
      def index
        @images = ImageManager.find(params[:registration], params[:stock_reference])
        render json: @images
      end
    end
  end
end
