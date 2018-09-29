import {connect} from 'react-redux';
import { login, receiveSessionErrors, clearSessionErrors } from '../../actions/session_actions';
import SessionForm from './session_form';

const msp = state => {
  return({
    errors: state.errors.session,
    formType: 'signin',
  })
};

const mdp = dispatch => {
  return({
    processForm: (user) => dispatch(login(user)),
    receiveSessionErrors: (errors) => dispatch(receiveSessionErrors(errors)),
    clearSessionErrors: () => dispatch(clearSessionErrors())
  })
};

export default connect(msp, mdp)(SessionForm);
