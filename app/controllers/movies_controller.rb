class MoviesController < ApplicationController
  def index
    @q = Movie.where(genre: ["basic", "git", "ruby", "rails"]).ransack(params[:q])
    @movies = @q.result.order(id: :asc).page(params[:page]).per(9)
  end
end
