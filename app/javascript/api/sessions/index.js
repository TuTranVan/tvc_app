import axios from 'axios';

axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector("meta[name=csrf-token]").content

export default {
  signIn(params, cb) {
    console.log(params)
    axios({
      method: "post",
      url: "/signin",
      params: params
    }).then(response => cb(response.data))
      .catch(error => cb(error.response.data))
  },
  signOut(cb) {
    axios({
      method: "delete",
      url: "/signout"
    }).then(response => cb(response.data))
  }
}
