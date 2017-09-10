class FollowingsController < ApplicationController
  def create
    following = Following.new(following_params)
    if following.save
      redirect_to controller: :events, action: :show, id: following.event_id
    else

    end
  end

  def destroy
    following = Following.find(params[:id])
    event_id = following.event_id
    following.destroy
    redirect_to controller: :events, action: :show, id: event_id
  end

  private
    def following_params
      params.require(:following).permit(:user_id, :event_id)
    end
end
