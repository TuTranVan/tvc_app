import admin_catgory_index from '../../../api/admin/categories/index'

const state = {
  categories: []
}

const actions = {
  getCategories({ commit }) {
    admin_catgory_index.getAllCategories(data => {
      commit('setCategories', data)
    })
  },
}

const mutations = {
  setCategories(state, res) {
    state.categories = res.categories
  }
}

export default {
  namespaced: true,
  state,
  actions,
  mutations
}
