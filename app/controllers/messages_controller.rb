class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    members = Member.where(user_id: current_user.id)
    @groups = []
    members.each do |member|
      @groups << Group.find(member.group_id)
    end
  end

end
