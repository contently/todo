import React from 'react';
import { Link } from 'react-router-dom';
import { Route } from 'react-router-dom';
import TaskItem from './task_item';

class ListShow extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      createTask: false,
      title: ""
    }
    this.openCreate = this.openCreate.bind(this);
    this.createNewTask = this.createNewTask.bind(this);
    this.closeCreate = this.closeCreate.bind(this)
    this.updateTitle = this.updateTitle.bind(this)
  }

  componentDidMount() {
    this.props.requestSingleList(this.props.match.params.listId).then(
      this.props.requestAllTasks()
    )
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.match.params.listId !== nextProps.match.params.listId) {
      this.props.requestSingleList(nextProps.match.params.listId);
    }
  }

  openCreate() {
    this.setState({createTask: true})
  }

  closeCreate() {
    this.setState({createTask: false})
  }

  createNewTask() {
    let listForm = new FormData();
    listForm.append("task[name]", this.state.title);
    listForm.append("task[completed]", false);
    listForm.append("task[list_id]", this.props.match.params.listId);
    this.props.createTask(listForm).then(
      this.setState({title: "", createTask: false})
    )
  }

  updateTitle(e) {
    this.setState({title: e.currentTarget.value})
  }

  render() {
    const {list, currentUser, tasks, deleteTask, updateTask} = this.props
    if(!list || !currentUser) {
      return null
    } else if(list && currentUser) {
      if(currentUser != list.user_id) {
        return null
      } else {
        return(
            <div className="lists-container">
              <div className={this.state.createTask ? "hidden" : "list-header"}>
                <div>
                  <h1>{list.name} Tasks</h1>
                  <span className="filter-container">
                    <p onClick={this.openCreate}>New Task</p>
                    <p className="filter">Filter</p>
                  </span>
                </div>
              </div>

              <div className={this.state.createTask ? "hidden" : "list-items-container"}>
                <ul>
                  {tasks.filter(task => task.list_id === list.id).map(task => <TaskItem currentUser={currentUser} deleteTask={deleteTask} updateTask={updateTask} key={task.id} task={task}/>)}
                </ul>
              </div>

              <div className = {this.state.createTask ? "list-header" : "hidden"}>
                <div>
                  <h1>New Task</h1>
                  <p onClick={this.closeCreate}>All Tasks</p>
                </div>
              </div>

              <div className = {this.state.createTask ? "list-items-container" : "hidden"}>
                <span>
                  <input onChange={this.updateTitle} value={this.state.title} placeholder="Title"></input>
                  <button onClick={this.createNewTask}>Create</button>
                </span>
              </div>
          </div>
        )
      }
    }
    }
  }


export default ListShow;
