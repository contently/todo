Ruby Developer Homework
================

To complete this homework, you will work on a simple Todo app in Rails. Our expectation is that you timebox the effort to 2 to 4 hours. You may work on any of the stories in the list below, but you are not expected to complete them all. Code quality is more important than quantity, we are more interested in how you approach the problems than how many you solve. Some of the user stories are ambiguous, there are many acceptable solutions, use your judgement. Frontend improvements are welcome, but optional.

You may be asked to explain your work and pair with a Contently engineer to further enhance the app.

To submit your homework, please update this README with information about which stories you completed, and submit the app as a zip file.

User stories to implement
----------------
 - A user should not be able to complete a task when creating it.
 - A user can filter their view by complete or incomplete tasks.
 - A user's default view is filtered to show only incomplete tasks.
 - A user should be able to keep multiple lists.
 - A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)
 - A user viewing a task should see a history of all its changes. (task audit trail)
 - A user should be able to see a history of all completed tasks and associated actions. (app audit trail)

Cleanup tasks
----------------
- Consolidate the repeated code between the create and edit feature specs for tasks.

Andy Feedback
---------------

Hey, thank you for reviewing this. I'll give a brief description of how I solved each problem (similar to what I'd put in a PR)

 - A user should not be able to complete a task when creating it.

Check in tasks/_form to see if we're creating a new record or not to conditionally hide/show the completed checkbox.

 - A user can filter their view by complete or incomplete tasks.
 - A user's default view is filtered to show only incomplete tasks.

Added migration to set the task boolean attribute to default to false (to look nice and have a value in the table). Added class method to 'task' to filter on the completed attribute. Controller filters for tasks based on the 'filter' query param. If ?filter=completed, then show completed tasks, otherwise show incomplete tasks. Added links to toggle between incomplete/complete tasks with help of the query param.

 - A user should be able to keep multiple lists.

Added list resource, which tasks are now nested beneath (/lists/1/tasks/2). I did this because when including lists, it doesn't make sense for tasks to not to belong to a list (like Trello). Slight reorganization of everything to get tasks nested below lists to work.

 - A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)

Added devise for auth. App check for authentication on every action, forcing user to sign in (authenticate_user! in application_controller).
Added method to User model to check if user is owner of a resource to determine if user should be allowed to access it. If user is not owner, raise exception. (could have redirected to somewhere else instead)

 - A user viewing a task should see a history of all its changes. (task audit trail)

Utilized gem paper_trail to keep track of attribute audit log. The audit log is shown on the task show view.

 - A user should be able to see a history of all completed tasks and associated actions. (app audit trail)

 Did not complete this due to time. But I think this is asking for info showing when any task in any list is completed. I think there is a way to get paper_trail to keep track of changes to a specific attribute in an associated resource. If so, then we can show all completed info on the list show view.


Included tests as I went (mix of TDD and not). Did not include any frontend improvements, but could easily be improved. Avoided other front end fun like including react to make List component to allow individual lists to be toggled between incomplete/complete on /lists (instead all lists follow the query param)
