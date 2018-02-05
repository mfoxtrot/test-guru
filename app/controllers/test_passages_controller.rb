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
    response = GistQuestionService.new(@test_passage).call
    flash[:notice] = "<a target='_blank' href='#{response.html_url}'>Gist</a> was created"
    Gist.create(question: @test_passage.current_question, user: current_user, url: response.html_url, hash_id: response.id)
    redirect_to test_passage_path(@test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
