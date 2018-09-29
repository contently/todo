import merge from 'lodash/merge';

import { RECEIVE_ALL_LISTS, RECEIVE_SINGLE_LIST } from '../actions/list_actions';

const listsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_ALL_LISTS:
      return merge({}, state, { [action.currentUser.id]: action.currentUser });

    case RECEIVE_SINGLE_LIST:
      return merge({}, state, { [action.currentUser.id]: action.currentUser });
    default:
      return state;
  }
};

export default listsReducer;
