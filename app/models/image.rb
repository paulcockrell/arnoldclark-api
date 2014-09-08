require Rails.root.join("lib/obfuscator.rb")

class Image
  include ActiveModel::Validations
  include ActiveModel::Serialization
  include ActiveModel::SerializerSupport

  BASE_URL = "http://imagecache.arnoldclark.com/imageserver/"
  CAMERA_ANGLES = %w{ f i r 4 5 6 }
  IMAGE_SIZES = %w{ 350 800 }

  attr_accessor :camera_angle,
                :image_size,
                :present,
                :registration,
                :stock_reference

  validates_presence_of :camera_angle, :image_size, :registration, :stock_reference
  validates_length_of :stock_reference, :minimum => 9

  def initialize(attr_hash = {})
    attr_hash.each { |k,v| self.send("#{k}=", v) }
  end

  def obfuscated_key
    return "" if invalid?

    Obfuscator::RegistrationReversor.obfuscate registration, stock_reference
  end

  def url
    return "" if invalid?

    File.join(BASE_URL, obfuscated_key, image_size, camera_angle)
  end
end
