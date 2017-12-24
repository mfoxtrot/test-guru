# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{email: 'admin@mail.ru'}, {email: 'user@mail.ru'}])

Category.create([{title: 'Ruby'}, {title: 'SQL'}, {title: 'HTML'}])

Test.create([{title: 'Синтаксис Ruby', level: 1, category_id: 1, user_id: 2},
  {title: 'DDL', level: 2, category_id: 2, user_id: 2},
  {title: 'Теги', level: 3, category_id: 3, user_id: 2}
])

Question.create([
    {body: 'Каким оператором начинается описание функции?', test_id: 1},
    {body: 'Какая команда используется для создания таблицы?', test_id: 2},
    {body: 'Какой тег используется для описания заголовка первого уровня?', test_id: 3}
])

Answer.create([
  {body: 'def', correct: true, question_id: 1},
  {body: 'func', correct: false, question_id: 1},
  {body: 'proc', correct: false, question_id: 1},
  {body: 'create table', correct: true, question_id: 2},
  {body: 'make table', correct: false, question_id: 2},
  {body: 'prepare table', correct: false, question_id: 2},
  {body: 'h1', correct: true, question_id: 3},
  {body: 'header1', correct: false, question_id: 3},
  {body: 'title', correct: false, question_id: 3}
])
