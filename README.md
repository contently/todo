Ruby Developer Homework
================

To complete this homework, you will work on a simple Todo app in Rails. Our expectation is that you timebox the effort to 2 to 4 hours. You may work on any of the stories in the list below, but you are not expected to complete them all. Code quality is more important than quantity, we are more interested in how you approach the problems than how many you solve. Some of the user stories are ambiguous, there are many acceptable solutions, use your judgement. Frontend improvements are welcome, but optional.

You may be asked to explain your work and pair with a Contently engineer to further enhance the app.

To submit your homework, please update this README with information about which stories you completed, and submit the app as a zip file.

User stories to implement
----------------
 - A user should not be able to complete a task when creating it.
 - [BC: For this I set the boolean default to false in the migration and removed the radio button if the `task.id` is not preset. i.e not yet created]
 - A user can filter their view by complete or incomplete tasks.
 - [BC: For this I created standard routes and views and class methods on the **Task** model to return a collection of completed and incompleted tasks]
 - A user's default view is filtered to show only incomplete tasks.
 - [BC: For this I set the root path to the incompleted task view]
 - A user should be able to keep multiple lists.
 - [BC: for this I created a **List** and **ListItem** model with a one to many relation. I used the *‘nested_form_fields'* gem to pass the nested attributes for `list_items` in the **List** form.]
 - A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)
 - [BC: For this I used devise and filtered all new tasks and all task list views through `current_user.tasks` in the `tasks_controller`]
 - A user viewing a task should see a history of all its changes. (task audit trail)
 - A user should be able to see a history of all completed tasks and associated actions. (app audit trail)
 - [BC: For these 2 tasks I used the audit gem]

Cleanup tasks
----------------
- Consolidate the repeated code between the create and edit feature specs for tasks.
- [BC: For this I created a simple `create_update` function containing the repeat code and passed in the small difference as an argument]
