class VotesController < ApplicationController
  before_action :find_question
  before_action :find_answer

  private
    def find_question
      @question = Question.find_by(id: params[:question_id])
    end

    def find_answer
      @answer = Answer.find_by(id: params[:answer_id])
    end

end
