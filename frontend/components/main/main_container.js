import { connect } from 'react-redux';
import { requestAllLists } from '../../actions/list_actions';

import Main from './main';

const msp = state => {
  return({
    currentUser: state.entities.users[state.session.id],
    lists: state.entities.lists
  })
};

const mdp = dispatch => {
  return({
    requestAllLists: () => dispatch(requestAllLists()),
  })
};

export default connect(msp, mdp)(Main);
