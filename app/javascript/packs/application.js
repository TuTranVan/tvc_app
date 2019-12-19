import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import store from 'store'

Vue.use(BootstrapVue)

import AdminSidebar from 'admin/sidebar'
import AdminHeader from 'admin/header'

import UsersNew from 'users/new'
import SessionsNew from 'sessions/new'
import UsersIndex from 'admin/users/index'
import CategoriesIndex from 'admin/categories/index'

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#sessions-new',
    store,
    render: h => h(SessionsNew, {})
  })
  new Vue({
    el: '#users-new',
    render: h => h(UsersNew, {})
  })
  new Vue({
    el: '#admin-user-index',
    store,
    render: h => h(UsersIndex, {})
  })
  new Vue({
    el: '#admin-category-index',
    store,
    render: h => h(CategoriesIndex, {})
  })
  new Vue({
    el: '#admin-sidebar',
    render: h => h(AdminSidebar, {})
  })
  new Vue({
    el: '#admin-header',
    render: h => h(AdminHeader, {})
  })

})

