json.array!(@task_changes) do |task_change|
  json.extract! task_change, :id, :action, :task_id
  json.url list_url(task_change, format: :json)
end
