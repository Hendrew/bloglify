# frozen_string_literal: true

module Front
  class ArticlesController < BaseController
    def index
      @articles = Article.order(created_at: :desc).includes(:user)
    end

    def show
      @article = Article.find_by(slug: params[:slug])
    end
  end
end
