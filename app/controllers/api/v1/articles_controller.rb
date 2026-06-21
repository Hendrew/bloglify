# frozen_string_literal: true

module Api::V1
  class ArticlesController < BaseController
    def index
      @articles = Article.where(active: true).order(created_at: :desc)

      render json: { data: ArticlesSerializer.collection_serialize(@articles) }, status: :ok
    end

    def show
      @article = Article.where(active: true).find_by(slug: params[:id])

      render json: { data: ArticlesSerializer.object_serialize(@article) }, status: :ok
    end
  end
end
