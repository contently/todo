json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :completed
  json.url task_url(task, format: :json)
end
