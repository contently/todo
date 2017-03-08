Ruby Developer Homework
================

To complete this homework, you will work on a simple Todo app in Rails. Our expectation is that you timebox the effort to 2 to 4 hours. You may work on any of the stories in the list below, but you are not expected to complete them all. Code quality is more important than quantity, we are more interested in how you approach the problems than how many you solve. Some of the user stories are ambiguous, there are many acceptable solutions, use your judgement. Frontend improvements are welcome, but optional.

You may be asked to explain your work and pair with a Contently engineer to further enhance the app.

To submit your homework, please update this README with information about which stories you completed, and submit the app as a zip file.

User stories to implement
----------------
 - HW1: A user should not be able to complete a task when creating it.
 - HW2: A user can filter their view by complete or incomplete tasks.
 - HW3: A user's default view is filtered to show only incomplete tasks.
 - HW4: A user should be able to keep multiple lists.
 - HW5: A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)
 - A user viewing a task should see a history of all its changes. (task audit trail)
 - A user should be able to see a history of all completed tasks and associated actions. (app audit trail)

Cleanup tasks
----------------
- Consolidate the repeated code between the create and edit feature specs for tasks.

Hi!
I managed to make it till the fifth task. I hope that's enough.
In addition to the quick comments below, I also tagged all my inline comments
with the user story code, so searching for "HW1", "HW2". etc should
take you right to my changes.

-denzil

Cliff notes:
HW1: I invalidate the model if it had completed set to true on creation, and hide the checkbox on creation.

HW2: I made the call to make this a frontend filter, at least I get to show some coffeescript

HW3: A trivial change once HW2 was done. UX could use a lot of attention.

HW4: Migrated a new table "Lists" that have many tasks. I decided to nest the 'list' and 'task' controllers.

HW5: Migrated a new table "Users" that have many lists. My auth system offers embarassingly little security, but I
     think it demonstrates the user story adequately.
