class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend

  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_favthings = user.favthings.count
  end


  def mcounts(micropost)
    @count_funs = micropost.funs.count
  end
end
