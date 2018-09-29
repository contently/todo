import React from 'react';
import { Link } from 'react-router-dom';

class TaskItem extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
    }
    this.updateComplete = this.updateComplete.bind(this);
    this.deleteTask = this.deleteTask.bind(this);
  }

  updateComplete() {
    let taskForm = new FormData();
    taskForm.append("task[completed]", !this.props.task.completed);

    this.props.updateTask(this.props.task.id, taskForm)
  }

  deleteTask() {
    this.props.deleteTask(this.props.task.id)
  }

  render() {
      return(
        <li>
          <div className="list-options">
            <p onClick={this.updateList}>Edit</p>
            <p onClick={this.deleteTask}>Delete</p>
          </div>

          <div className="list-title">
            <div>
              <h4>{this.props.task.name}</h4>
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
