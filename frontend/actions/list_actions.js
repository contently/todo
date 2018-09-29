import * as APIUtil from '../util/calendar_api_util';
export const RECEIVE_ALL_LISTS  = 'RECEIVE_ALL_LISTS ';
export const RECEIVE_SINGLE_LIST  = 'RECEIVE_SINGLE_LIST ';

export const receiveAllLists = (lists) => (
  {
    type: RECEIVE_ALL_LISTS,
    lists
  }
);

export const receiveSingleList = (list) => (
  {
    type: RECEIVE_SINGLE_LIST,
    list
  }
);

export const requestAllLists = () => dispatch => (
  APIUtil.fetchAllLists().then(lists => (dispatch(receiveAllLists(lists)))
));

export const requestSingleMonth = (id) => dispatch => (
  APIUtil.fetchSingleList(id).then(list => (dispatch(receiveSingleList(list)))
));
