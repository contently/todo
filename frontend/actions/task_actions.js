import * as APIUtil from '../util/task_api_util';
export const RECEIVE_ALL_TASKS  = 'RECEIVE_ALL_TASKS ';
export const RECEIVE_SINGLE_TASK  = 'RECEIVE_SINGLE_TASK ';
export const RECEIVE_TASK_ERRORS  = 'RECEIVE_TASK_ERRORS ';
export const DESTROY_TASK  = 'DESTROY_TASK ';

export const receiveAllTasks = (tasks) => (
  {
    type: RECEIVE_ALL_TASKS,
    tasks
  }
);

export const receiveSingleTask = (task) => (
  {
    type: RECEIVE_SINGLE_TASK,
    task
  }
);

export const receiveErrors = (errs) => (
  {
    type: RECEIVE_TASK_ERRORS,
    errs
  }
);

export const receiveDestroyedTask = task => ({
  type: DESTROY_TASK,
  task
});

export const requestAllTasks = () => dispatch => (
  APIUtil.fetchAllTasks().then(tasks => (dispatch(receiveAllTasks(tasks)))
));

export const requestSingleTask = (id) => dispatch => (
  APIUtil.fetchSingleTask(id).then(task => (dispatch(receiveSingleTask(task)))
));

export const createTask = task => dispatch => {
  return(APIUtil.createTask(task).then(task => (
    dispatch(receiveSingleTask(task))
  ), err => (
    dispatch(receiveErrors(err.responseJSON))
  ))
)
};

export const deleteTask = (taskId) => dispatch => {
  return APIUtil.deleteTask(taskId).then(task => dispatch(receiveDestroyedTask(task)));
};

export const updateTask = (id,task) => dispatch => {
  return(
    APIUtil.updateTask(id,task).then(task => dispatch(receiveSingleTask(task)),
  err => dispatch(receiveErrors(err.responseJSON))));
};
