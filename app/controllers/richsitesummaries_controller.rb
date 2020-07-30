class RichsitesummariesController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :new, :creaate]
  
  def index
    @richsitesummaries = Richsitesummary.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @richsitesummary = Richsitesummary.find(params[:id])
    @articles = @richsitesummary.articles.order(published: :desc).page(params[:page])
  end

  def new
    @richsitesummary = Richsitesummary.new
  end

  def create
    @richsitesummary = Richsitesummary.new(rss_params)
    begin
      xml= HTTParty.get(@richsitesummary.rss_url).body
      rss = Feedjira.parse(xml)
      @richsitesummary.title = rss.title
      @richsitesummary.source_url = rss.url
      @richsitesummary.last_modified = rss.last_modified
    rescue

    end
    
    if @richsitesummary.save
      flash[:success] = 'RSSを登録しました。'
      redirect_to @richsitesummary
    else
      flash.now[:danger] = 'RSSの登録に失敗しました。'
      render :new
    end
  end
  
  def rss_params
    params.require(:richsitesummary).permit(:rss_url)
  end
  
end
