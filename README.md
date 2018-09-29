Ruby Developer Homework
================

This App build was created with a Rails backend and React/Redux frontend.  To launch the app,
simply bundle install all ruby gems, run npm install / webpack --watch and view in localhost.

User stories to implement
----------------
- [x] A user should not be able to complete a task when creating it.
- [x] A user can filter their view by complete or incomplete tasks.
- [x] A user's default view is filtered to show only incomplete tasks.
- [x] A user should be able to keep multiple lists.
- [x] A user should have access to only their tasks. (may require devise or a creative, lightweight auth system)
 - [ ] A user viewing a task should see a history of all its changes. (task audit trail)
 - [ ] A user should be able to see a history of all completed tasks and associated actions. (app audit trail)

Cleanup tasks
----------------
- [ ] Consolidate the repeated code between the create and edit feature specs for tasks.
