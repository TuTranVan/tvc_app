import axios from 'axios';

export default {
  getAllCategories(cb) {
    axios.get('/admin/categories.json').then(function (response) {
      cb(response.data)
    })["catch"](function (error) {
      console.log(error);
    });
  }
}
