import { connect } from 'react-redux';
import { logout, login } from '../../actions/session_actions';
import NavBar from './nav_bar';

const msp = state => {
  return({
    currentUser: state.entities.users[state.session.id]
  })
};

const mdp = dispatch => {
  return({
    logout: () => dispatch(logout()),
    login: (user) => dispatch(login(user)),
  })
};

export default connect(msp, mdp)(NavBar);
