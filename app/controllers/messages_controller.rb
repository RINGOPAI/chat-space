class MessagesController < ApplicationController
  before_action :index_info

  def index
  end

  def create
    @newmessage = @group.messages.new(message_params)
    if @newmessage.save
      respond_to do |format|
        format.html { redirect_to action: :index }
        format.json
      end
    else
      flash[:alert] = "メッセージの入力か、画像の添付をしてください"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image, :image_cache).merge(user_id: current_user.id)
  end

  def index_info
    @group = Group.find(params[:group_id])
    @messages = @group.messages.includes(:user)
    @groups = current_user.groups
    @message = @group.messages.new
  end
end
