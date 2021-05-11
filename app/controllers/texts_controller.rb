class TextsController < ApplicationController
  def index
    #@texts = Text.where(genre: ["basic", "git", "ruby", "rails"]).order(id: :asc)
    @q = Text.ransack(params[:q])
    @texts = @q.result(distinct: true).page(params[:page])
  end

  def show
    @text = Text.find(params[:id])
  end
end
