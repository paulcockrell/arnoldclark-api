class ImageSerializer < ActiveModel::Serializer
  attributes :camera_angle,
             :image_size,
             :obfuscated_key,
             :present,
             :registration,
             :stock_reference,
             :url
end
