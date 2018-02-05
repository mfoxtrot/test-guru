class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: [:show, :result, :update, :gist]

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answers_ids])
    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_url = GistQuestionService.new.call(params_for_gist)
    redirect_to test_passage_path(@test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def params_for_gist
    question = @test_passage.current_question
    {description: '', public: true, files: {"'question_#{question.id}''": {content: question.answers.pluck(:body).join("\n")}}}
  end
end
