Ruby Developer Homework
================

To complete this homework, you will work on a simple Todo app in Rails. Our expectation is that you timebox the effort to 2 to 4 hours. You may work on any of the stories in the list below, but you are not expected to complete them all. Code quality is more important than quantity, we are more interested in how you approach the problems than how many you solve. Some of the user stories are ambiguous, there are many acceptable solutions, use your judgement. Frontend improvements are welcome, but optional.

You may be asked to explain your work and pair with a Contently engineer to further enhance the app.

To submit your homework, please update this README with information about which stories you completed, and submit the app as a zip file.

User stories to implement
----------------
 - A user should not be able to complete a task when creating it.
  - The 'completed' checkbox is removed when creating a task.
  - There should probably be a backend validation preventing this as well.
 - A user can filter their view by complete or incomplete tasks.
  - A dropdown filter was added to the tasks index(this later became the list show page).
  - The filter is executed within the Task model.
  - This filter is also available as a parameter when accessing json for the task index, defaulting to all tasks.
 - A user's default view is filtered to show only incomplete tasks.
  - The Task.completed_filter method defaults to show only incomplete tasks.
 - A user should be able to keep multiple lists.
  - A List model was added and /lists becomes the root route.
  - A validation was added to return a 404 error notice if an invalid list id is requested.
 - A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)
  - A User devise model was added and only a signed-in user's lists are accessible.
  - A validation was added to check if the user is the owner of the list/task - invalid requests are returned to the lists index.
 - A user viewing a task should see a history of all its changes. (task audit trail)
  - A TaskChange model was added, and a new task_change object is created on creation/update of a task, with information on that change's specific action recorded (creation, name change, or completion).
  - The name change log includes the old and new name.
  - Task changes are created within :before_update and :before_create methods in the Task model.
  - An audit log was added to the task show/edit page containing each action and the time of its execution
 - A user should be able to see a history of all completed tasks and associated actions. (app audit trail)
  - An app audit log with all task changes was added, accessible from all pages
  - Instead of only completed tasks, all tasks and their associated actions are visible in the audit log.
  - The audit log is available as json as well

Additional user stories implemented
----------------------
- A user should be able to edit a task from the show page
  - The edit and show pages were consolidated
  - A show route was retained for retrieving task json from the api
  - A request to a task show page is redirected to its edit page
- A user should be able to see a tally of complete and incomplete tasks for each list in the lists index
  - These columns were added to the lists index
- A user should be able to request json for all list tasks and list audit logs
  - Json builders were added for the tasks index and the list audit logs

Future user stories to implement
----------------------
- A user shouldn't be able to edit a task after completing it
- A user should be able to see a history of deleted tasks in the audit log
- A user should be able to prioritize tasks
- A user should be able to search for a specific task
- A user should be able to filter/search the audit logs

Cleanup tasks
----------------
- Consolidate the repeated code between the create and edit feature specs for tasks.
  - An rspec helper - FeatureHelper - was added to DRY up the no name error tests

Developer Notes
----------------
- The devise gem was added to the Gemfile to enable user authentication
- The capybara and selenium-webdriver gems were updated in order to run the one js-dependent test in the specs(task filtering)
- The shoulda-matchers gem was added to the Gemfile for testing associations

ERD
---

| Users   |
| ------  |
| email   |
| password|

 `|`  
`/|\`

| Lists   |
| ------  |
| name    |
| user_id |

 `|`  
`/|\`

| Tasks    |
| ------   |
| name     |
| completed|
| list_id  |  

 `|`  
`/|\`

| TaskChanges |
| ------      |
| action      |
| task_id     |
