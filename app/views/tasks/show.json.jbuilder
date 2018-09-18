json.extract! @task, :id, :name, :completed, :created_at, :updated_at
json.versions @task.versions
