import * as APIUtil from '../util/list_api_util';
export const RECEIVE_ALL_LISTS  = 'RECEIVE_ALL_LISTS ';
export const RECEIVE_SINGLE_LIST  = 'RECEIVE_SINGLE_LIST ';
export const RECEIVE_ERRORS  = 'RECEIVE_ERRORS ';

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

export const receiveErrors = (errs) => (
  {
    type: RECEIVE_ERRORS,
    errs
  }
);

export const requestAllLists = () => dispatch => (
  APIUtil.fetchAllLists().then(lists => (dispatch(receiveAllLists(lists)))
));

export const requestSingleList = (id) => dispatch => (
  APIUtil.fetchSingleList(id).then(list => (dispatch(receiveSingleList(list)))
));

export const createList = list => dispatch => {
  return(APIUtil.createList(list).then(list => (
    dispatch(receiveSingleList(list))
  ), err => (
    dispatch(receiveErrors(err.responseJSON))
  ))
)
};
