# frozen_string_literal: true

json.array!(@tasks) do |task|
  json.extract! task, :id, :name, :completed
  json.url list_task_url(task.list, task, format: :json)
end
