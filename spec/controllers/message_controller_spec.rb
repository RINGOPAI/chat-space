require 'rails_helper'
describe MessagesController do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:messages) { create_list(:message, 3, user: user, group: group) }


  describe "GET #index" do
    context "ログインしている場合" do
      before do
        login_user user
        get :index, params: { group_id: group }
      end
      it "indexビューが表示されるか" do
        expect(response).to render_template :index
      end

      it "@groupはあるか" do
        expect(assigns(:group)).to match(group)
      end

      it "@messageはあるか" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "@messagesはあるか" do
        expect(assigns(:messages)).to match(messages)
      end
    end

    context "ログインしていない場合" do
      before do
        get :index, params: { group_id: group }
      end
      it "ログインページにリダイレクトされるか" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end

  describe "POST #create" do
    context "ログインしている場合" do
      before do
        login_user user
      end

      it "保存に成功" do
        expect{post :create, params: { group_id: group, message: attributes_for(:message, user: user, group: group) }}.to change(Message, :count).by(1)
      end

      it "保存に失敗" do
        expect{post :create, params: { group_id: group, message: attributes_for(:message, body: nil, image: nil, user: user, group: group) }}.not_to change(Message, :count)
      end
    end

    context "ログインしていない場合" do
      it "ログインページにリダイレクトされるか" do
        post :create, params: { group_id: group, message: attributes_for(:message, user: user, group: group) }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end
