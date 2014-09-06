class ImageManager

  def self.find(registration, stock_reference)
    image_array = create_image_instances(registration, stock_reference)

    begin
      image_array.map do |image|
        RestClient.get(image.url) do |response, request, result, &block|
          image.present = response.code == 200 ? true : false
        end
      end
    rescue Exception => e
      # some stuff here
    end

    image_array
  end


  private

  def self.create_image_instances(registration, stock_reference)
    registration = registration.strip.upcase
    stock_reference = stock_reference.strip.upcase

    [].tap do |el|
      Image::IMAGE_SIZES.each do |image_size|
        Image::CAMERA_ANGLES.each do |camera_angle|
          el << Image.new(
            :camera_angle => camera_angle,
            :image_size => image_size,
            :present => false,
            :registration => registration,
            :stock_reference => stock_reference
          )
        end
      end
    end
  end

  def self.obfuscate(registration, stock_reference)
    Obfuscator::RegistrationReversor.obfuscate(registration.to_s, stock_reference.to_s)
  end
end
