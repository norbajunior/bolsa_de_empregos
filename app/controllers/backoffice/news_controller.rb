class Backoffice::NewsController < Backoffice::BaseController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  def index
    @news = News.by(filter_params).page(params[:page])
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

    flash[:notice] = 'Notícia criada com sucesso' if @news.save

    respond_with @news, location: [:backoffice, @news]
  end

  def update
    flash[:notice] = 'Notícia atualizada com sucesso' if @news.update(news_params)

    respond_with @news, location: [:backoffice, @news]
  end

  def destroy
    @news.destroy

    respond_with @news, location: [:backoffice, @news]
  end

  private

  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title, :date, :summary, :text, :image, :featured, :active, :image_cache)
  end

  def filter_params
    if params[:filter]
      params.require(:filter).permit(:title)
    end
  end
end
