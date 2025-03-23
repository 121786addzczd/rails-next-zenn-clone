class Api::V1::ArticlesController < ApplicationController
  def show
    article = Article.published.find(params[:id])
    render json: article
  end
end
