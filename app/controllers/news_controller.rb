class NewsController < ApplicationController
  load_and_authorize_resource

  def index
    @news = News.all.page(params[:page])
  end

  def show
    @news = News.find(params[:id])
  end
end
