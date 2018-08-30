json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :completed, :list_id
  json.url list_url(task, format: :json)
end
