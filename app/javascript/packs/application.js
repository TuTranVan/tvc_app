import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

import UsersNew from 'users/new'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#users-new',
    render: h => h(UsersNew, {})
  })
})
