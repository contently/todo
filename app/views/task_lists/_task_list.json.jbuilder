json.extract! task_list, :id, :list_name, :created_at, :updated_at
json.url task_list_url(task_list, format: :json)
