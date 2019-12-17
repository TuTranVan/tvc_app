import admin_catgory_index from '../../../api/admin/categories/index'

const state = {
  categories: [],
  categoriesParent: [],
  newCategory: {},
  editCategory: {},
  errors: {}
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
        commit('setErrorsCreate', data)
      }
    })
  },
  editCategory({ commit }, category) {
    commit('editCategory', category)
  },
  updateCategory({ commit }, category) {
    admin_catgory_index.updateCategory({ id: state.editCategory.id, category: category }, data => {
      if (data.hasOwnProperty('category')) {
        commit('updateCategory', data)
        commit('clearErrors')
        commit('clearCategory')
      } else {
        commit('setErrorsUpdate', data)
      }
    })
  },
  deleteCategory({ commit }, category) {
    admin_catgory_index.deleteCategory(category.id, data => {
      if (data.hasOwnProperty('error')) {
        alert(data.error)
      } else {
        commit('deleteCategory', category)
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
  editCategory(state, res) {
    state.editCategory = res
  },
  updateCategory(state, res) {
    window.location.reload()
  },
  deleteCategory(state, res) {
    state.categories = state.categories.filter(category => {
      return category.id != res.id && category.parent != res.name
    })
  },
  clearCategory(state) {
    state.newCategory = {}
    state.editCategory = {}
  },
  setErrorsCreate(state, res) {
    state.errors = { create: res.errors }
  },
  setErrorsUpdate(state, res) {
    state.errors = { update: res.errors }
  },
  clearErrors(state) {
    state.errors = {}
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
