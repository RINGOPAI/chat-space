class MessagesController < ApplicationController
  before_action :index_info

  def index
  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to acrion: :index
    else
      flash[:alert] = "メッセージの入力か、画像の添付をしてください"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image, :image_cache).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def index_info
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @message = Message.new
  end
end
