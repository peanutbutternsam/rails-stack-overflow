class AnswersController < ApplicationController
  before_action :find_answer, only: [:show, :edit, :update, :destroy, :index, :upvote, :downvote]
  before_action :find_question

  def index
    @answers = @question.answers
    @vote = @answer.votes.build
  end

  def show
  end

  def new
  end

  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to @question
    else
      render @question
    end
  end

  def upvote
    @answer.votes.create(upvote: true)
    redirect_to @question
  end

  def downvote
    @answer.votes.create(upvote: false)
    redirect_to @question
  end

  private
    def answer_params
      params.require(:answer).permit(:title, :content)
    end

    def find_answer
      @answer = Answer.find_by(id: params[:id])
    end

    def find_question
      @question = Question.find_by(id: params[:question_id])
    end
end
