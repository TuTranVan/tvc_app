import admin_catgory_index from '../../../api/admin/categories/index'

const state = {
  categories: [],
  categoriesParent: [],
  newCategory: {},
  errors: []
}

const getters = {
  getCategoriesParent: state => {
    return state.categories.filter(category => category.parent == null)
  }
}

const actions = {
  getCategories({ commit }) {
    admin_catgory_index.getAllCategories(data => {
      commit('setCategories', data)
      commit('setCategoriesParent')
    })
  },
  addCategory({ commit }) {
    admin_catgory_index.createCategory(state.newCategory, data => {
      if (data.hasOwnProperty('category')) {
        commit('addCategory', data)
        commit('clearErrors')
        commit('clearCategory')
      } else {
        commit('setErrors', data)
      }
    })
  }
}

const mutations = {
  setCategories(state, res) {
    state.categories = res.categories
  },
  setCategoriesParent(state) {
    state.categoriesParent = getters.getCategoriesParent
  },
  addCategory(state, res) {
    state.categories.push(res.category)
  },
  clearCategory(state) {
    state.newCategory = {}
  },
  setErrors(state, res) {
    state.errors = res.errors
  },
  clearErrors(state) {
    state.errors = []
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
