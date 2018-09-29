import merge from 'lodash/merge';

import { RECEIVE_ALL_LISTS, RECEIVE_SINGLE_LIST, DESTROY_LIST } from '../actions/list_actions';

const listsReducer = (state = {}, action) => {
  let newState = {};
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_LISTS:
      return merge({}, state, action.lists);
    case RECEIVE_SINGLE_LIST:
      return merge({}, state, { [action.list.id]: action.list });
    case DESTROY_LIST:
      newState = merge({}, state);
      delete newState[action.list.id];
      return newState;
    default:
      return state;
  }
};

export default listsReducer;
