class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end
  
  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end
  
  def create
    @article = Article.new(article_attributes)
    @article.user = User.first.id
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if  @article.update(article_attributes)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  private
  
  def article_attributes
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find_by id: params[:id]
  end
end
