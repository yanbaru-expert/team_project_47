class QuestionsController < ApplicationController
  def index
    @questions = Question.where(genre: ["basic", "git", "ruby", "rails"]).order(id: :asc)
  end

  def show
    @question = Question.find(params[:id])
  end
end
