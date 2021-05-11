class MoviesController < ApplicationController
  def index
    @movies = Movie.where(genre: ["basic", "git", "ruby", "rails"]).order(id: :asc).page(params[:page]).per(9)
  end
end
