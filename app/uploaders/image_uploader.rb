class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def store_dir
    "uploads/#{model.class.name.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w[gif jpg jpeg png]
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or
      model.instance_variable_set(var, SecureRandom.hex(10))
  end
end
