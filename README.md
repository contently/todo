Ruby Developer Homework
================

To complete this homework, you will work on a simple Todo app in Rails. Our expectation is that you timebox the effort to 2 to 4 hours. You may work on any of the stories in the list below, but you are not expected to complete them all. Code quality is more important than quantity, we are more interested in how you approach the problems than how many you solve. Some of the user stories are ambiguous, there are many acceptable solutions, use your judgement. Frontend improvements are welcome, but optional.

You may be asked to explain your work and pair with a Contently engineer to further enhance the app.

To submit your homework, please update this README with information about which stories you completed, and submit the app as a zip file.

User stories to implement (with added notes):
----------------
 - (Completed) A user should not be able to complete a task when creating it.
    - Checkbox was not made available when creating a task, changed the default value to be 'false' in the model.

 - (Completed) A user can filter their view by complete or incomplete tasks.
    - Added link_to buttons to filter out results
    - These grab different results based on which method each link_to uses.
    - Please ask me about how I would have done this differently because I have thoughts on this :)

 - (Completed) A user's default view is filtered to show only incomplete tasks.
    - Index method only grabs incomplete tasks. This is okay because of the filtering buttons/links added in previous problem.

 - A user should be able to keep multiple lists.

 - (Completed) A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)
    - Devise was added to the app, authentication is required to view any tasks and the `@tasks` value was replaced only to get tasks made by that user.
    - A one to many relationship was created between user to tasks and preparing active record for ease of use.
    - An access method was made to check if `user_id` matches in the task to prevent viewing/editing by going to the task directly via the route.

 - (Started) A user viewing a task should see a history of all its changes. (task audit trail)
    - Another one to many relationship was created between task to histories; a new table where each row would be a logged change. Under the update method I would insert the current fields with a time stamp in the history table before changing it to it's new value.

 - A user should be able to see a history of all completed tasks and associated actions. (app audit trail)

Cleanup tasks
----------------
- (Completed, I think) Consolidate the repeated code between the create and edit feature specs for tasks.
  - I kept the form and the method the same, and just added an `if` statement based on the method that was used which is passed through `params`


Planning (prior to coding):
-------------
 - 'if' statement based on action to leave out 'complete' checkbox on form if the action is 'new'
 - radio buttons with filter options, change 'index' to reflect results (UJS?)
 - leave previous radio for 'incomplete' checked by default
 - multiple lists? different todos?
 - "one to many" db table for "user to tasks"
 - "one to many" db table for "task to changes"
 - completed list of all tasks, all history?
