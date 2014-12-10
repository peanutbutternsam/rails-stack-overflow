class QuestionsController < ApplicationController
  include ZenHelper
  before_action :set_question, :except => [:new, :create]

  def index
    @questions = Question.all
    @question = Question.new
    @vote = @question.answers.build
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
      if @question.save
        redirect_to @question
      else
        render 'new'
      end
  end

  def show
    @answer = @question.answers.build
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def upvote
    @question.votes.create(upvote: true)
    redirect_to root_path
  end

  def downvote
    @question.votes.create(upvote: false)
    redirect_to root_path
  end

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end

    def set_question
      @question = Question.find_by(id: params[:id])
    end

end
