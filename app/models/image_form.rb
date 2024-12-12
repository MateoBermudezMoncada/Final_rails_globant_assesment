# app/models/image_form.rb
class ImageForm < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 500 }

  validates :image, presence: true
  validate :image_format
  validate :image_size

  private

  def image_format
    if image.attached? && !image.content_type.in?([ "image/png", "image/jpg", "image/jpeg" ])
      errors.add(:image, "must be a PNG, JPG, or JPEG file")
    end
  end

  def image_size
    if image.attached? && image.byte_size > 3.megabytes
      errors.add(:image, "size should be less than 3MB")
    end
  end
end
