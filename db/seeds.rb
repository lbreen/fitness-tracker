require 'faker'

Activity.destroy_all
Exercise.destroy_all
User.destroy_all

puts "**Destroyed previous data**"



exercise_titles = ["1.5 mile run", "3 mile run", "5 mile run", "8 mile tab"]
activity_comments = ["Feeling sluggish ", "Really good - fresh legs", "Absolutely knackered about halfway but pushed through"]

exercise_titles.each do |title|
  ex = Exercise.create!({
    title: title,
    user_id: user.id
    })

  5.times do
    activity = Activity.new({
      date: Faker::Date.backward(7),
      time_taken: rand(400.0...600.0),
      comments: activity_comments.sample
      })

    activity.exercise = ex
    activity.save!
  end
end

puts "**DB seeded!**"
