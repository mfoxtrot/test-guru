class TestsController < ApplicationController
  before_action :find_test, only: [:show]
  def index
    @tests = Test.all
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
  
  def test_params
    params.permit(:id)
  end
end
