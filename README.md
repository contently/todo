Ruby Developer Homework
================

To complete this homework, you will work on a simple Todo app in Rails. Our expectation is that you timebox the effort to 2 to 4 hours. You may work on any of the stories in the list below, but you are not expected to complete them all. Code quality is more important than quantity, we are more interested in how you approach the problems than how many you solve. Some of the user stories are ambiguous, there are many acceptable solutions, use your judgement. Frontend improvements are welcome, but optional.

You may be asked to explain your work and pair with a Contently engineer to further enhance the app.

To submit your homework, please update this README with information about which stories you completed, and submit the app as a zip file.

demo gif: https://giphy.com/gifs/mXSoKnTKdZ4PzYn7Eh

![rails todo demo](https://media.giphy.com/media/mXSoKnTKdZ4PzYn7Eh/giphy.gif)

User stories to implement
----------------
 - A user should not be able to complete a task when creating it. #DONE
 > in tasks form, applying display-none class to 'completed' field if current_page?(new_task_path) returns true

 - A user can filter their view by complete or incomplete tasks. #DONE
 > in tasks_controller, index method renders different tasks depending on if params[:completed] equals 'true', 'false' or neither, which returns all tasks

 - A user's default view is filtered to show only incomplete tasks. #DONE
 > added custom routes to tasks_controller actions, done and incomplete, and made root route to tasks#incomplete

 - A user should be able to keep multiple lists. #DONE
 > created List model, added associations to models, added list_id column to Task table, and ran migrations to updated tables in database, then added list_id as a permitted params and updated tasks/views/form page so users can input a task's list_id, which gets saved to database

 - A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)
 - A user viewing a task should see a history of all its changes. (task audit trail)
 - A user should be able to see a history of all completed tasks and associated actions. (app audit trail)

Cleanup tasks
----------------
- Consolidate the repeated code between the create and edit feature specs for tasks.
> updating dependencies in Gemfile.lock to eliminate Github alerts
