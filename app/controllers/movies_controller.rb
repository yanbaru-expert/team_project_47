class MoviesController < ApplicationController
  def index
    genre_movies = Movie.where(genre: ["basic", "git", "ruby", "rails"]).order(id: :asc).page(params[:page]).per(9)
    @q = genre_movies.ransack(params[:q])
    @movies = @q.result.page(params[:page]).per(9)
  end
end
