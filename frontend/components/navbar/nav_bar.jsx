import React from 'react';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter,
  withRouter
} from 'react-router-dom';
class NavBar extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
    }
    this.demo = this.demo.bind(this)
    this.closeOut = this.closeOut.bind(this)
  }

  demo() {
    this.props.login({username: "DemoUser", password: 123456})
  }

  closeOut() {
    this.props.logout().then(this.props.history.push('/'))
  }

  render() {
    const {currentUser, logout} = this.props
    let loggedin;
    let userDropDown;
    if (!currentUser) {
      loggedin = <div className="options">
        <Link to='/signin'>Sign In</Link>
        <button onClick={this.demo}>Demo</button>
      </div>
      } else {
        loggedin = <div className="user-profile-div">
          <span>
            {currentUser.username}
          </span>
          <button onClick={this.closeOut}>Sign Out</button>
        </div>
      }
      return(
        <header className="main-nav">
          <nav className="left-nav">
            <ul>
              <li>
                <Link to="/"><p>Todo App</p></Link>
                <span><i class="fas fa-clipboard-check"></i>
                </span>
                <nav className="hometext">Todo Home</nav>
              </li>
            </ul>
            {loggedin}

          </nav>
        </header>
      )
    }
  }


export default withRouter(NavBar);
