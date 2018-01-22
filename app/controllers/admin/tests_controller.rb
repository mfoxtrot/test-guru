class Admin::TestsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :start]
  before_action :find_test, only: [:show, :start]

  def index
    @tests = Test.all
  end

  def show
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.permit(:id)
  end

end
