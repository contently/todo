import { connect } from 'react-redux';
import { requestSingleList } from '../../actions/list_actions';
import { requestAllTasks, deleteTask,createTask,updateTask } from '../../actions/task_actions';
import { selectTasks } from '../../reducers/selectors';
import ListShow from './list_show';

const msp = (state, ownProps) => {
  return({
    currentUser: state.session.id,
    list: state.entities.lists[ownProps.match.params.listId],
    tasks: selectTasks(state)
  })
};

const mdp = dispatch => {
  return({
    requestSingleList: (id) => dispatch(requestSingleList(id)),
    requestAllTasks: () => dispatch(requestAllTasks()),
    deleteTask: (id) => dispatch(deleteTask(id)),
    createTask: (task) => dispatch(createTask(task)),
    updateTask: (id,task) => dispatch(updateTask(id,task)),
  })
};

export default connect(msp, mdp)(ListShow);
