class TextsController < ApplicationController
  def index
    @q = Text.where(genre: ["basic", "git", "ruby", "rails"]).ransack(params[:q])
    @texts = @q.result.order(id: :asc).page(params[:page])
  end

  def show
    @text = Text.find(params[:id])
  end
end
