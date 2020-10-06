# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.first

5.times do
  tg = u.task_groups.create(name: Faker::Job.title)
  u.ungrouped_tasks.create(name: Faker::Food.dish)
  5.times do
    tg.tasks.create(name: Faker::Food.dish)
  end
end