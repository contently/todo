json.array!(@lists) do |list|
  json.extract! task, :id, :name
  json.url list_url(list, format: :json)
  json.tasks list.tasks
end
