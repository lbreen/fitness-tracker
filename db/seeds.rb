require 'faker'

Attempt.destroy_all
Exercise.destroy_all

exercise_titles = ["1.5 mile run", "3 mile run", "5 mile run", "8 mile tab"]
attempt_comments = ["Feeling sluggish ", "Really good - fresh legs", "Absolutely knackered about halfway but pushed through"]

exercise_titles.each do |title|
  ex = Exercise.create!({
    title: title,
    user_id: User.first.id
    })

  5.times do
    attempt = Attempt.new({
      date: Faker::Date.backward(7),
      time_taken: rand(400.0...600.0),
      comments: attempt_comments.sample
      })

    attempt.exercise = ex
    attempt.save!
  end
end
