import session_index from '../../api/sessions/index'

const state = {
  auth: false,
  user: {},
  error: ""
}

const actions = {
  signIn({ commit }) {
    session_index.signIn(state.user, data => {
      if (data.hasOwnProperty('auth')) {
        commit('setAuth', data)
        commit('clearError')
        commit('clearUser')
      } else {
        commit('setError', data)
      }
    })
  },
  signOut({ commit }) {
    session_index.signOut(data => {
      commit('clearAuth')
    })
  },
  getAuth({ commit }) {
    if (localStorage.getItem("auth")) {
      commit('getAuth', JSON.parse(localStorage.getItem("auth")))
    }
  }
}

const mutations = {
  setAuth(state, res) {
    state.auth = res.auth
    localStorage.setItem('auth', JSON.stringify(state.auth))
  },
  getAuth(state, res) {
    state.auth = res
  },
  clearAuth(state) {
    state.auth = false
    localStorage.removeItem('auth')
  },
  setError(state, res) {
    state.error = res.error
  },
  clearError(state) {
    state.error = ""
  },
  clearUser(state) {
    state.user = {}
  }
}

export default {
  namespaced: true,
  state,
  actions,
  mutations
}
