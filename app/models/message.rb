class Message < ApplicationRecord
  validates :body_or_image, presence: true
  belongs_to :user
  belongs_to :group

  def body_or_image
    # bodyかimageのどちらかが入っていればOK
    body.presence or image.presence
  end
end
