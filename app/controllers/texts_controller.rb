class TextsController < ApplicationController
  def index
    @texts = Text.where(genre: ["basic", "git", "ruby", "rails"]).order(id: :asc)
  end

  def show
    @text = Text.find(params[:id])
  end
end
