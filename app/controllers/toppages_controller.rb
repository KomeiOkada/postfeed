class ToppagesController < ApplicationController
  def index
    if logged_in?
      @articles = current_user.feed_rss.order(id: :desc).page(params[:page])
    end
  end
end
