class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      #do something
      flash[:notice] = "Article was successfylly created"
      redirect_to article_path(@article)
    else
      render 'new'
    end

  end

  def update
    @article = Article.find(params[:id])
    if @article.update
      flash[:notice] = "Article was successfully update"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end


  def show
    @article = Article.find(params[:id])
  end


  # article_params method
  private
  def article_params
    params.require(:article).permit(:title, :description)
  end

  

end