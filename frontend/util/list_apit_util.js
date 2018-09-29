export const fetchAllLists = () => (
  $.ajax({
    method: 'GET',
    url: 'api/lists',
  })
);

export const fetchSingleList = (id) => (
  $.ajax({
    method: 'GET',
    url: `api/lists/${id}`,
  })
);

export const createList = (list) => (
  $.ajax({
    method: 'POST',
    url: '/api/lists',
    processData: false,
    contentType: false,
    dataType: 'json',
    data: list
  })
);

export const updateList = (listId, data) => {
  return $.ajax({
    method: 'PATCH',
    url: `api/lists/${listId}`,
    data,
    processData: false,
    contentType: false,
    dataType: 'json',
  });
};

export const deleteVideo = (id) => {
  return $.ajax({
      method: 'delete',
      url: `/api/lists/${id}`
  });
};
