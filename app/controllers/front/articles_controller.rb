# frozen_string_literal: true

module Front
  class ArticlesController < BaseController
    def index
      @articles = Article.where(active: true).order(created_at: :desc).includes(:user)
    end

    def show
      @article = Article.where(active: true).find_by(slug: params[:slug])

      redirect_to root_path if @article.nil?
    end
  end
end
