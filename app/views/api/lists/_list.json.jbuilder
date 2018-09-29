json.extract! list, :id, :user_id, :name
tasks = list.tasks
json.listTasks tasks
