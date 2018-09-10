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





My Notes:
----------------

 I was able to complete the following user stories:
 
 - A user should not be able to complete a task when creating it.

Solution: removing the field on the create task form that let users mark as complete on creation. Add initialize method on Task model to set complete to false

 - A user can filter their view by complete or incomplete tasks.

Solution: use params to specify if the index view for tasks should show completed tasks or all tasks (users can view these filtered states through links on the list#show page) . Also added methods to the List model to easily filter for tasks that are complete vs. incomplete

 - A user's default view is filtered to show only incomplete tasks.

Solution: when first directed to a list#show page, the default list view shows only incomplete tasks

 - A user should be able to keep multiple lists.

Solution: update Task model to belong to new List model which in-turn belongs to new User model. Users can view their current lists and then click into a single list to see its tasks.

 - A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)

Solution: implement user authentication using Bcrypt gem, and add helper methods to redirect users to the welcome page if they try to access a list or tasks that are not theirs.


I was not able to complete the following tasks due to timeboxing:

 - Cleanup tasks 
 - A user viewing a task should see a history of all its changes. (task audit trail)
 - A user should be able to see a history of all completed tasks and associated actions. (app audit trail)

Possible Solution: I did some research and this gem seems like it would have been a great resource to use to track the history of object changes in the app:
https://github.com/paper-trail-gem/paper_trail


Summary of Challenge:
----------------


After reading the user stories I knew that I wanted to start by creating new models for User and List as I knew that nesting those resources early on would make a huge difference in the behavior of the app and the other stories. After that came user authentication, in which I opted for the Bcrypt gem. From there I was able to focus on setting up the different views and controllers in order to knock out as much of the task filtering functionality as I could.

I haven't worked in Rails in a while, and so it definitely cost me time in completing this challenge in order to get back up to speed with the syntax and conventions. I also wasn't familiar with the style of ruby that was present in the existing Tasks controller and so understanding that took some time as well. There is still a lot of refactoring that I would have loved to go back and tackle. Ultimately though this was a great learning experience for me to dive back into working with Rails and I thoroughly enjoyed it!