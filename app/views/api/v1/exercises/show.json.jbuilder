json.extract! @exercise, :id, :title, :description
json.attempts @exercise.attempts do |attempt|
  json.extract! attempt, :id, :date, :time_taken, :comments
end
