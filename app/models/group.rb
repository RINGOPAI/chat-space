class Group < ApplicationRecord
  validates :name, presence: true
  has_many :members
  has_many :users, through: :members
  has_many :messages

  def sidebar_message
    if self.messages.last.body?
      self.messages.last.body
    elsif self.messages.last.image?
      "画像が投稿されています"
    end
  end
end
