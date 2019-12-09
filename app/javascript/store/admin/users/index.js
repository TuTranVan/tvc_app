import admin_user_index from '../../../api/admin/users/index'

const state = {
  users: []
}

const actions = {
  getUsers({ commit }) {
    admin_user_index.getAllUsers(data => {
      commit('setUsers', data)
    })
  },
}

const mutations = {
  setUsers(state, res){
    state.users = res.users
  }
}

export default {
  namespaced: true,
  state,
  actions,
  mutations
}
