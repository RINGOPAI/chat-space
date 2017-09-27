class Message < ApplicationRecord
  validates :body_or_image, presence: true
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader

  def body_or_image
    # bodyかimageのどちらかが入っていればOK
    body.presence || image.presence || image_cache.presence
  end
end
