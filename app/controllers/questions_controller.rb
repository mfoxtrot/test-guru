class QuestionsController < ApplicationController
  before_action :find_test, only: [:index]
  before_action :find_question, only: [:show, :destroy]
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @questions = @test.questions
    html_string = '<h1>Перечень вопросов:</h1>'
    @questions.each { |q| html_string << "<li>#{q.body}</li>" }
    html_string << '<a href="/tests/2/questions/new">Добавить</a>'
    render html: html_string.html_safe
  end

  def show
    html_string = '<h1>Вопрос №' + params[:id].to_str + '</h1>'
    html_string << '<p>' + @question.body
    render html: html_string.html_safe
  end

  def new
  end

  def create
    @question = Question.create(question_params)
  end

  def destroy
    @question.delete
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.permit(:body, :test_id)
  end

  def record_not_found
    render plain: '404 Not found', status: 404
  end
end
