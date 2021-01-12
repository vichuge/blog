class ArticlesController < ApplicationController
    #If def index is empty, this will open the views/articles/index.html.erb file
    def index #Show the articles list
        @articles = Article.all
    end

    def show #Show only one article
        @article = Article.find(params[:id])
    end

    def new #Show the creation article page
        @article = Article.new
    end

    def create #Create the page for the database
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render :new
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render :edit
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to root_path
    end

    private
    def article_params #Take model params for the values
        params.require(:article).permit(:title, :body)
    end
end
