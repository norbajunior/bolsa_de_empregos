class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.all
  end

  def show
  end

  def new
    @news = News.new
  end

  def edit
  end

  def create
    @news = News.new(news_params)

    @news.save

    respond_with @news, notice: I18n.t('flash.notice', model: I18n.t('activerecord.models.news'))
  end

  def update
    @news.update(news_params)

    respond_with @news, notice: I18n.t('flash.notice_update', model: I18n.t('activerecord.models.news'))
  end

  def destroy
    @news.destroy

    respond_with @news
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :date, :summary, :text, :image, :featured, :active)
  end
end
