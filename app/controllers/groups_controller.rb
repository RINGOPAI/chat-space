class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    Group.create(create_params)
    redirect_to root_path, notice: "グループを作成しました"
  end

  def edit
  end

  def update
    redirect_to root_path
  end

  private
  def create_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end
