import React from 'react';
import {
  Route,
  Redirect,
  Switch,
  Link,
  HashRouter,
  withRouter
} from 'react-router-dom';

class Main extends React.Component {
  constructor(props) {
    super(props)
    this.state = {

    }
  }

  componentDidMount() {
    this.props.requestAllLists()
  }

  render() {
    const {  currentUser, lists } = this.props;
    if (!currentUser) {
      return <div className="main-logo">
              <span>
                <i className="fas fa-clipboard-check">
                </i>
              </span>
            </div>;
    }
        return(
          <div className="lists-container">
            <div className="list-header">
              <h1>Your Lists</h1>
              <p>Create New List</p>
            </div>

        </div>
      )
    }
}


  export default Main;
