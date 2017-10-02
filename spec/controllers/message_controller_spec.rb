require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }

  describe "GET #index" do
    before do
      login_user user
    end

    it "メッセージアクションで定義しているインスタンス変数はあるか" do
      @group = user.groups.first
      binding.pry
      get :index, params: { group_id: @group.id }
      groups = user.groups
      expect(assigns(:groups)).to eq groups
    end
    it "メッセージ一覧のビューが表示されているか" do
      @group = user.groups
      get :index, params: { group_id: @group.id }
      groups = user.groups
      expect(response).to render_template :index
    end
  end
end
