module EventsHelper
  def check_following(event_id)
    following = Following.where(event_id: event_id).where(user_id: session[:user_id]).first
    following.nil?
  end

  def get_following(event_id)
    following = Following.where(event_id: event_id).where(user_id: session[:user_id]).first
    if following
      @following = following
    else
      @following = Following.new
    end
  end
end
