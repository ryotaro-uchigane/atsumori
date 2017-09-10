class FollowingController < ApplicationController
  def create
    following = Following.new(following_params)
    if following.save
      render template: event_path, id: following.event_id
    else

    end
  end

  def update

  end

  private
    def following_params
      params.require(:following).permit(:user_id, :event_id)
    end
end
