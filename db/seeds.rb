# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{email: 'admin@mail.ru'}, {email: 'user@mail.ru'}])

Category.create([{title: 'Ruby'}, {title: 'SQL'}, {title: 'HTML'}])

Question.create([
    {body: 'Каким оператором начинается описание функции?'},
    {body: 'Какая команда используется для создания таблицы?'},
    {body: 'Какой тег используется для описания заголовка первого уровня?'}
])

Answer.create([
  {body: 'def', correct: true},
  {body: 'func', correct: false},
  {body: 'proc', correct: false},
  {body: 'create table', correct: true},
  {body: 'make table', correct: false},
  {body: 'prepare table', correct: false},
  {body: 'h1', correct: true},
  {body: 'header1', correct: false},
  {body: 'title', correct: false}
])

Test.create([
  {title: 'Синтаксис Ruby', level: 0, category_id: 1},
  {title: 'DDL', level: 1, category_id: 2},
  {title: 'Теги', level: 0, category_id: 3}
])

Test.find(1).users << User.find(1)
Test.find(1).users << User.find(2)
