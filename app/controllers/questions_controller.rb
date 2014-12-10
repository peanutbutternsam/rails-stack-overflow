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
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question successfully created'}
        format.js { render :create }
        # redirect_to @question
      else
        format.html { render action: 'index' }
        format.js { render :error }
        # render 'new'
      end
    end
  end

  def show
    @answer = @question.answers.build
    @answers = @question.answers
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
