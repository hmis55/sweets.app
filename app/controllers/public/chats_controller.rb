class Public::ChatsController < ApplicationController
    # showアクションにおいて、関連のないユーザーをブロックする
  before_action :block_non_related_users, only: [:show]

  # チャットルームの表示
  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    unless user_rooms.nil?
      @room = user_rooms.room
    else
      @room = Room.new
      @room.save
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
      UserRoom.create(user_id: @user.id, room_id: @room.id)
    end

    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  # チャットメッセージの送信
  def create
    @chat = current_user.chats.new(chat_params)
    render :validate unless @chat.save
  end

  # チャットメッセージの削除
  def destroy
    @chat = current_user.chats.find(params[:id])
    @chat.destroy
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

  # 関連のないユーザーをブロックする
  def block_non_related_users
    user = User.find(params[:id])

    unless current_user.following?(user) && user.following?(current_user)
      redirect_to posts_path 
    end
  end
end