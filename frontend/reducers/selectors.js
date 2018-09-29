import values from 'lodash/values';

export const selectLists = state => values(state.entities.lists);
