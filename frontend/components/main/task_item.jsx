import React from 'react';
import { Link } from 'react-router-dom';

class TaskItem extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      editForm: false,
      title: ""
    }
    this.updateComplete = this.updateComplete.bind(this);
    this.deleteTask = this.deleteTask.bind(this);
    this.updateTask = this.updateTask.bind(this);
    this.newTitle = this.newTitle.bind(this);
    this.saveTask = this.saveTask.bind(this);
  }

  updateComplete() {
    let taskForm = new FormData();
    taskForm.append("task[completed]", !this.props.task.completed);

    this.props.updateTask(this.props.task.id, taskForm)
  }

  deleteTask() {
    this.props.deleteTask(this.props.task.id)
  }

  updateTask() {
    this.setState({editForm: true})
  }

  newTitle(e) {
    this.setState({title: e.currentTarget.value})
  }

  saveTask() {
    let taskForm = new FormData();
    taskForm.append("task[name]", this.state.title);

    this.props.updateTask(this.props.task.id, taskForm).then(
      this.setState({editForm: false, title: ""})
    )
  }

  render() {
      return(
        <li>
          <div className="list-options">
            <p className={this.state.editForm ? "hidden" : ""} onClick={this.updateTask}>Edit</p>
            <p className={this.state.editForm ? "" : "hidden"} onClick={this.saveTask}>Save</p>
            <p onClick={this.deleteTask}>Delete</p>
          </div>

          <div className="list-title">
            <div>
              <h4 className={this.state.editForm ? "hidden" : "title"}>{this.props.task.name}</h4>
              <input onChange={this.newTitle} placeholder={this.props.task.name} className={this.state.editForm ? "editform" : "hidden"} value={this.state.title}/>
                <div>
                  <input onChange={this.updateComplete}type="checkbox" checked={this.props.task.completed} name="completed"/> Completed
                </div>
            </div>
          </div>
        </li>
      )
    }
  }


export default TaskItem;
