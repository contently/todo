import React from 'react';
import ListItem from './list_item';
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
      createForm: false,
      title: ""
    }
    this.openCreate = this.openCreate.bind(this)
    this.updateTitle = this.updateTitle.bind(this)
    this.createNewList = this.createNewList.bind(this)
  }

  componentDidMount() {
    this.props.requestAllLists()
  }

  openCreate() {
    this.setState({createForm: true})
  }

  updateTitle(e) {
    this.setState({title: e.currentTarget.value})
  }

  createNewList() {
    let listForm = new FormData();
    listForm.append("list[name]", this.state.title);

    this.props.createList(listForm).then(
      this.setState({title: "", createForm: false})
    )
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
              <div>
                <h1>Your Lists</h1>
                <p onClick={this.openCreate}>Create New List</p>
              </div>
            </div>

            <div className="list-items-container">
              <ul>
                {lists.map(list => <ListItem currentUser={currentUser} key={list.id} list={list}/>)}
              </ul>
            </div>

            <div className = {this.state.createForm ? "create-form" : "hidden"}>
              <input onChange={this.updateTitle} value={this.state.title} placeholder="Title"></input>
              <button onClick={this.createNewList}>Create</button>
            </div>

        </div>
      )
    }
}


  export default Main;
