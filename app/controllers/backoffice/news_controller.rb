class Backoffice::NewsController < Backoffice::BaseController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  respond_to :js, :html, only: [:destroy]

  def index
    @news = Search.by(News.all, filter_params).page(params[:page])
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

    redirect_to [:backoffice, @news], notice: I18n.t('flash.notice', model: I18n.t('activerecord.models.news'))
  end

  def update
    @news.update(news_params)

    redirect_to [:backoffice, @news], notice: I18n.t('flash.notice_update', model: I18n.t('activerecord.models.news'))
  end

  def destroy
    @news.destroy

    respond_with [:backoffice, @news]
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :date, :summary, :text, :image, :featured, :active)
  end

  def filter_params
    if params[:filter]
      params.require(:filter).permit(:title)
    end
  end
end
