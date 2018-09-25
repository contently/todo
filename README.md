Ruby Developer Homework
================

To complete this homework, you will work on a simple Todo app in Rails. Our expectation is that you timebox the effort to 2 to 4 hours. You may work on any of the stories in the list below, but you are not expected to complete them all. Code quality is more important than quantity, we are more interested in how you approach the problems than how many you solve. Some of the user stories are ambiguous, there are many acceptable solutions, use your judgement. Frontend improvements are welcome, but optional.

You may be asked to explain your work and pair with a Contently engineer to further enhance the app.

To submit your homework, please update this README with information about which stories you completed, and submit the app as a zip file.

User stories to implement
----------------
- (solved) A user should not be able to complete a task when creating it.

  - In addition to having the default value as false in the database, I've also created a model level method `#set_completed_field_to_false_for_new_records` for tasks, so it triggers the `before_save` callback to set the false value if the resource is a `new_record`. I also took out the completed form field, since that field will just be an extra click for the user in terms of UX.

- (solved) A user can filter their view by complete or incomplete tasks.

  - Added scopes to the Task model to filter outo complete/incompleted tasks, and used params filter system to display correct tasks.

- (solved) A user's default view is filtered to show only incomplete tasks.

  - Using the scope methods from the above user story, I added filter systems using the param values. It's not as elegant, but simple and does its job well.

- (solved) A user should be able to keep multiple lists.

  - Made the database association between user and the list, so that each list `belongs_to` the `User`. This way we can easily retrieve all lists that belongs to the user and keep multiple lists under a specific user.

- A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)

  - I ran out of time for this one, but I would have created a model method, #entity_owner?(resource), that checks if `current_user` is same as the one that is associated with the tasks or lists.

- A user viewing a task should see a history of all its changes. (task audit trail)
- A user should be able to see a history of all completed tasks and associated actions. (app audit trail)

  - Also ran out of time for both problems, but I would use paper_trail gem to audit these trails.

Cleanup tasks
----------------
- (solved) Consolidate the repeated code between the create and edit feature specs for tasks.
  - Created tasks_spec_support to share a method that contains the similar browser behavior testing codes. Used fixtures and before block.


## If I had little more time:

I would definitely write more tests. I made a mistake spending too much time in designing the app and coding the application. I would also use `concern` for controllers to DRY out repetitive codes in the `controller`. In the end, this was a fun project and I would definitely love to discuss more about this in person!

Thank you so much for inviting me to solve this problem, and I really look forward to hearing back from you. Thank you very much and I truly appreciate your time and consideration.

James Hwang.

