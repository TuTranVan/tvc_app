import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import axios from 'axios'
import store from 'store'

Vue.use(BootstrapVue)

import AdminSidebar from 'admin/sidebar'
import AdminHeader from 'admin/header'

import UsersNew from 'users/new'
import SessionsNew from 'sessions/new'
import UsersIndex from 'admin/users/index'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#admin-user-index',
    store,
    render: h => h(UsersIndex, {})
  })
  new Vue({
    el: '#admin-sidebar',
    render: h => h(AdminSidebar, {})
  })
  new Vue({
    el: '#admin-header',
    render: h => h(AdminHeader, {})
  })

  new Vue({
    el: '#sessions-new',
    render: h => h(SessionsNew, {})
  })
})

