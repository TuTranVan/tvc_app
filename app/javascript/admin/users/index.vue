<template>
  <div>
    <h1>Users</h1>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Email</th>
          <th scope="col">Name</th>
          <th scope="col">Phone</th>
          <th scope="col">Address</th>
        </tr>
      </thead>
      <tbody v-for="(user, index) in users">
        <tr>
          <th scope="row">{{user.id}}</th>
          <td>{{user.email}}</td>
          <td>{{user.full_name}}</td>
          <td>{{user.phone}}</td>
          <td>{{user.address}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script>
  import { mapState } from 'vuex'

  export default {
    data() {
      return {
      }
    },
    methods: {
    },
    computed: {
      ...mapState({
        users: state => state.admin_user_index.users
      })
    },
    mounted: function() {
      this.$store.dispatch('admin_user_index/getUsers')
    }
  }
</script>
