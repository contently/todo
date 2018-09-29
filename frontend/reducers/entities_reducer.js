import { combineReducers } from 'redux';

import usersReducer from './users_reducer';
import listsReducer from './lists_reducer';

const entitiesReducer = combineReducers({
  users: usersReducer,
  lists: listsReducer,
});

export default entitiesReducer;
