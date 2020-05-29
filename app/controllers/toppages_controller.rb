class ToppagesController < ApplicationController
  def index
    if logged_in?
      @articles = current_user.feed_rss.order(published: :desc).page(params[:page])
    end
  end
end
