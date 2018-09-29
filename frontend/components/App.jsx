import React from 'react';
import LogInFormContainer from './session/login_form_container';
import SignUpFormContainer from './session/signup_form_container';
import NavBarContainer from './navbar/nav_bar_container';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter
} from 'react-router-dom';
import { AuthRoute, ProtectedRoute } from '../util/route_util';


const App = () => (
  <div id="app">
    <NavBarContainer />
     <Switch>
        <AuthRoute exact path="/signin" component={LogInFormContainer} />
        <AuthRoute exact path="/signup" component={SignUpFormContainer} />
     </Switch>
  </div>
);

export default App;
