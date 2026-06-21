# frozen_string_literal: true

module Backoffice
  class ArticlesController < BaseController
    before_action :find_article, only: %i[show edit update destroy]

    # GET /backoffice/articles
    def index
      all_data = Article.order(created_at: :desc).includes(:user)

      @pagy, @articles = pagy(all_data)
    end

    # GET /backoffice/articles/new
    def new
      @article = Article.new

      render :form
    end

    # GET /backoffice/articles/:id
    def show; end

    # GET /backoffice/articles/:id/edit
    def edit
      render :form
    end

    # POST /backoffice/articles
    def create
      @article = Article.new(article_params)
      @article.user = current_user

      if @article.save
        redirect_to backoffice_article_path(@article), notice: "Artigo cadastrado com sucesso."
      else
        render :form, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /backoffice/articles/:id
    def update
      if @article.update(article_params)
        redirect_to backoffice_article_path(@article), notice: "Artigo atualizado com sucesso."
      else
        render :form, status: :unprocessable_entity
      end
    end

    # DELETE /backoffice/articles/:id
    def destroy
      @article.destroy

      redirect_to backoffice_articles_path, notice: "Artigo excluído com sucesso."
    end

    private

    def find_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body, :active)
    end
  end
end
