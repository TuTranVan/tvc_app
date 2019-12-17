import axios from 'axios';

axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector("meta[name=csrf-token]").content

export default {
  getAllCategories(cb) {
    axios.get('/admin/categories.json').then(response => cb(response.data))
  },
  createCategory(params, cb) {
    axios({
      method: "post",
      url: '/admin/categories',
      params: params
    }).then(response => cb(response.data))
      .catch(error => cb(error.response.data))
  },
  updateCategory(params, cb) {
    axios({
      method: "put",
      url: '/admin/categories/' + params.id,
      params: params.category
    }).then(response => cb(response.data))
      .catch(error => cb(error.response.data))
  },
  deleteCategory(params, cb) {
    axios({
      method: "delete",
      url: '/admin/categories/' + params
    }).then(response => cb(response.data))
      .catch(error => cb(error.response.data))
  }
}
