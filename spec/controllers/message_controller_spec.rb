require 'rails_helper'

describe MessageController, type: :controller do
  let(:user)  { create(:user) }

  describe "GET #index" do
    before do
      login_user user
    end
    it "renders the :index template" do
    end
  end
end
