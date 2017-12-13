class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy, :edit, :update]

  def index
  end

  def show
  end

  def edit
  end

  def new
    @question = Question.new
  end

  def update
    @question.update(question_params)
    redirect_to test_questions_path(@test)
  end

  def create
    @test.questions.create(question_params)
    redirect_to test_questions_path(@test)
  end

  def destroy
    @test = @question.test
    @question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
    @test = @question.test
  end

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

end
