class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    user_groups
  end

  def user_groups
    members = Member.where(user_id: current_user.id)
    @groups = []
    members.each do |member|
      @groups << Group.find(member.group_id)
    end
    return @groups
  end

end
