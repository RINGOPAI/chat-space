class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_group, only: [:edit, :update]

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
  end

  def update
    if @group.update(create_params)
      redirect_to root_path, notice: "グループを編集しました"
    else
      render :edit
    end
  end

  def user_group
    @group = Group.find(params[:id])
  end

  private
  def create_params
    params.require(:group).permit(:name, { :user_ids => [] })
  end
end
