import Vue from 'vue'
import Vuex from 'vuex'

import admin_user_index from './admin/users/index'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    admin_user_index
  }
})
