class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = User.find(current_user.id).groups
  end

end
