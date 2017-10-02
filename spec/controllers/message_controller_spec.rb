require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #index' do
    before do
      login_user user
    end

    it "アクション内で定義しているインスタンス変数があるか" do
      @group = user.groups.first
      get :index, params: { group_id: @group.id }
      groups = user.groups
      expect(assigns(:groups)).to eq groups
    end
  end
end
