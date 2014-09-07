class ImageManager

  def self.find(registration, stock_reference)
    image_array = create_image_instances(registration, stock_reference)

    image_array.map do |image|
      Thread.new do
        begin
          response = RestClient.get(image.url)
          image.present = response.code == 200 ? true : false
        rescue SocketError, URI::InvalidURIError, RestClient::ResourceNotFound
          image.present = false
        end
      end
    end.each { |thread| thread.join }

    image_array
  end


  private

  def self.create_image_instances(registration, stock_reference)
    [].tap do |el|
      Image::IMAGE_SIZES.each do |image_size|
        Image::CAMERA_ANGLES.each do |camera_angle|
          el << Image.new(
            :camera_angle => camera_angle,
            :image_size => image_size,
            :present => false,
            :registration => registration.strip.upcase,
            :stock_reference => stock_reference.strip.upcase
          )
        end
      end
    end
  end
end
