class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]

  def index
    render html: generate_index_page.html_safe
  end

  def show
    render html: generate_show_page.html_safe
  end

  def new
  end

  def create
    @test.questions.create(question_params)
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

  def generate_index_page
    html_string = '<h1>Перечень вопросов:</h1><ul>'
    @test.questions.pluck(:body).each { |b| html_string << "<li>#{b}</li>" }
    html_string << '</ul><a href="/tests/2/questions/new">Добавить</a>'
    html_string
  end

  def generate_show_page
    html_string = "<h1>Вопрос №#{params[:id]}</h1>"
    html_string << "<p>#{@question.body}</p>"
    html_string
  end
end
