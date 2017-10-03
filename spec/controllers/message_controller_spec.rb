require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:groups) { user.groups }
  let(:message) { create(:message) }
  let(:messages) { group.messages }

  describe 'GET #index' do

    it "(ログインしている)アクション内で定義しているインスタンス変数があるか" do
      login_user user
      get :index, params: { group_id: group.id }
    end
  end
end
