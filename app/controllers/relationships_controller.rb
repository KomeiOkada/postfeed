class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    richsitesummary = Richsitesummary.find(params[:richsitesummary_id])
    current_user.follow(richsitesummary)
    flash[:success] = 'RSSをフォローしました．'
    redirect_to richsitesummary
  end

  def destroy
    richsitesummary = Richsitesummary.find(params[:richsitesummary_id])
    current_user.unfollow(richsitesummary)
    flash[:success] = 'RSSをフォロー解除しました．'
    redirect_to richsitesummary
  end
end
