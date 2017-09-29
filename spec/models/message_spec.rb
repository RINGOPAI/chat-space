require 'rails_helper'

describe Message do
  describe "#create" do
    before :each do
      user = create(:user)
      group = create(:group)
    end

    it "メッセージがあれば保存できる" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

    it "画像があれば保存できる" do
      message = build(:message, body: "")
      expect(message).to be_valid
    end

    it "メッセージと画像があれば保存できる" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "メッセージも画像もないと保存できない" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:body_or_image]).to include("can't be blank")
    end

    it "group_idがないと保存できない" do
      message = build(:message, group_id: nil)
      message.valid?
      expect(message.errors[:group]).to include("must exist")

    end

    it "user_idがないと保存できない" do
      message = build(:message, user_id: nil)
      message.valid?
      expect(message.errors[:user]).to include("must exist")
    end
  end
end
