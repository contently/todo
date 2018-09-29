import { connect } from 'react-redux';
import { requestAllLists,createList,deleteList } from '../../actions/list_actions';
import { selectLists } from '../../reducers/selectors';

import Main from './main';

const msp = state => {
  return({
    currentUser: state.entities.users[state.session.id],
    lists: selectLists(state)
  })
};

const mdp = dispatch => {
  return({
    requestAllLists: () => dispatch(requestAllLists()),
    createList: (list) => dispatch(createList(list)),
    deleteList: (listId) => dispatch(deleteList(listId))
  })
};

export default connect(msp, mdp)(Main);
