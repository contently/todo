import values from 'lodash/values';

export const selectLists = state => values(state.entities.lists);
export const selectTasks = state => values(state.entities.tasks);
