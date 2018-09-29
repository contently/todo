export const fetchAllTasks = () => (
  $.ajax({
    method: 'GET',
    url: 'api/tasks',
  })
);

export const fetchSingleTask = (id) => (
  $.ajax({
    method: 'GET',
    url: `api/tasks/${id}`,
  })
);

export const createTask = (task) => (
  $.ajax({
    method: 'POST',
    url: '/api/tasks',
    processData: false,
    contentType: false,
    dataType: 'json',
    data: task
  })
);

export const deleteTask = (id) => {
  return $.ajax({
      method: 'delete',
      url: `/api/tasks/${id}`
  });
};

export const updateTask = (taskId, data) => {
  return $.ajax({
    method: 'PATCH',
    url: `api/tasks/${taskId}`,
    data,
    processData: false,
    contentType: false,
    dataType: 'json',
  });
};
