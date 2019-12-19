<template>
  <div class="row" id="sessions-new">
    <div class="col-md-4">
      <div v-if="auth">
        <b class="text-success">{{ auth.full_name }} logged in system</b>
        <b-button size="sm" variant="danger" @click="onSignout">SignOut</b-button>
        <div>
          <b-link href="/admin/users" v-if="isAdmin">Manager</b-link>
        </div>
      </div>
      <b-form @submit="onSubmit" v-else>
        <b-form-group>
          <b-form-input
            v-model="user.email"
            type="email"
            required
            placeholder="Enter email"
          ></b-form-input>
        </b-form-group>

        <b-form-group>
          <b-form-input
            v-model="user.password"
            type="password"
            required
            placeholder="Enter password"
          ></b-form-input>
        </b-form-group>

        <b-button type="submit" variant="primary">Login</b-button>
        <p class="text-danger">{{ error }}</p>
      </b-form>
    </div>
  </div>
</template>

<script>
  import { mapState } from 'vuex'

  export default {
    data() {
      return {}
    },
    computed: {
      ...mapState({
        auth: state => state.session_index.auth,
        user: state => state.session_index.user,
        error: state => state.session_index.error
      }),
      isAdmin(){
        return this.auth.role == "admin"
      }
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        this.$store.dispatch('session_index/signIn')
      },
      onSignout(evt) {
        evt.preventDefault()
        this.$store.dispatch('session_index/signOut')
      }
    },
    mounted() {
      this.$store.dispatch('session_index/getAuth')
    }
  }
</script>
