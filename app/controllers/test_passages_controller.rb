class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: [:show, :result, :update, :gist]

  def show
  end

  def result
    @test_passage.finish!
    new_badges = CheckAchievements.new(@test_passage).call
    current_user.badges << new_badges
    flash[:notice] = "You have #{new_badges.count} new badges" if new_badges.count > 0
  end

  def update
    if @test_passage.remaining_time <= 0
      redirect_to result_test_passage_path(@test_passage)
    else
      @test_passage.accept!(params[:answers_ids])
      if @test_passage.completed?
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    end
  end

  def gist
    begin
      response = GistQuestionService.new(@test_passage).call
      flash[:notice] = "#{view_context.link_to t('.gist'), response.html_url, target: '_blank'} #{t('.was_created')}"
      current_user.gists.create(question: @test_passage.current_question, url: response.html_url, hash_id: response.id)
    rescue StandardError => e
      flash[:alert] = e.to_s
    end
    redirect_to test_passage_path(@test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
