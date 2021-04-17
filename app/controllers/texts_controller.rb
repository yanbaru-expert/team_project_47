class TextsController < ApplicationController
  before_action :authenticate_user!

  def index
    @texts = Text.where(genre: ["basic", "git", "ruby", "rails"]).order(id: :asc)
  end
end
