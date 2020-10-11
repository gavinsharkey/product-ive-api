# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create(display_name: 'Gavin Sharkey', email: 'sharkeyfamilygm@gmail.com', password: '12345')

tg = u.task_groups.create(name: 'Groceries')
tg.tasks.create(name: 'Apples')
tg.tasks.create(name: 'Oatmeal')
tg.tasks.create(name: 'Bananas')
tg.tasks.create(name: 'Tortillas')
tg.tasks.create(name: 'Avocados')

tg2 = u.task_groups.create(name: 'Stuff To Do')
tg2.tasks.create(name: 'Look for jobs on LinkedIn')
tg2.tasks.create(name: 'Email some fuckers')
tg2.tasks.create(name: 'Pack my shit')
tg2.tasks.create(name: 'work out')
tg2.tasks.create(name: 'EAT')