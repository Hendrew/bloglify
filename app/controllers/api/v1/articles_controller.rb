# frozen_string_literal: true

module Api::V1
  class ArticlesController < BaseController
    def index
      render json: { data: :articles }, status: :ok
    end
  end
end
