json.extract! @task, :id, :name, :completed, :created_at, :updated_at
json.versions @task.versions.localtime.strftime("%a %b %d at %I:%M %p")
