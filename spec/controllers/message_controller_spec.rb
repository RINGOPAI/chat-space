require 'rails_helper'
require 'pry'
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
  end

end
