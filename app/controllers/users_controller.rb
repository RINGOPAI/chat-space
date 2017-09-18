class UsersController < ApplicationController

  def edit
  end

  def update
    user = User.find(current_user)
    user.update(create_params)
    flash[:notice] = "アカウント情報を更新しました"
    redirect_to root_path
  end

  private
  def create_params
    params.require(:user).permit(:name, :email)
  end

end
