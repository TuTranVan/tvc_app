import axios from 'axios';

export default {
  getAllUsers (cb) {
    axios.get('/admin/users.json').then(function(response) {
      cb(response.data)
    })["catch"](function(error) {
      console.log(error);
    });
  }
}
