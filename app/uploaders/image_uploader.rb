class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    if Rails.env.production?
        storage :aws
    else
        storage :file
    end


    def store_dir
        "uploads/images/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Create different versions of your uploaded files:
    version :icon do
        process resize_to_fit: [300, 300]
    end

    version :main_game_image do
        process resize_to_fit: [400, 400]
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_whitelist
        %w(jpg jpeg gif png)
    end
end
