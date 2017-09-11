class ChatsController < ApplicationController
  def chats_guest
    gon.user_id = session[:user_id]
    gon.room_id = 'test'
  end

  def chats_host
    gon.user_id = session[:user_id]
    gon.room_id = 'test'
  end
end
