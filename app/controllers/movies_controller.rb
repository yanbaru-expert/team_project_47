class MoviesController < ApplicationController
  def index
    @movies = Movie.where(genre: ["basic", "git", "ruby", "rails"]).order(id: :asc)
    @movies = Movie.page(params[:page]).per(18)
  end
end
