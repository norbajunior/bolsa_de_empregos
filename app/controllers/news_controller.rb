class NewsController < ApplicationController
  load_and_authorize_resource

  def index
    @featured_news = @news.featured.order('RANDOM()').limit(2)

    @news = News.active.where.not(id: @featured_news.pluck(:id)).page(params[:page])
  end

  def show
    @news = News.find(params[:id])
  end
end
