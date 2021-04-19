class LikesController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    current_user.likes.create!(movie_id: @movie.id)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    current_user.likes.find_by(movie_id: @movie.id).destroy!
  end
end
