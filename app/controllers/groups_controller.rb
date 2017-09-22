class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(create_params)
      redirect_to root_path, notice: "グループを編集しました"
    else
      render :edit
    end
  end

  private
  def create_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end
