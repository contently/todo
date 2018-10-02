json.array!(@tasks) do |task|
  next if task.user_id != current_user.id
    json.extract! task, :id, :name, :completed, :user_id
    json.url task_url(task, format: :json)
end
