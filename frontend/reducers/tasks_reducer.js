import merge from 'lodash/merge';

import { RECEIVE_ALL_TASKS, RECEIVE_SINGLE_TASK, DESTROY_TASK } from '../actions/task_actions';

const tasksReducer = (state = {}, action) => {
  let newState = {};
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_TASKS:
      return merge({}, state, action.tasks);
    case RECEIVE_SINGLE_TASK:
      return merge({}, state, { [action.task.id]: action.task });
    case DESTROY_TASK:
      newState = merge({}, state);
      delete newState[action.task.id];
      return newState;
    default:
      return state;
  }
};

export default tasksReducer;
