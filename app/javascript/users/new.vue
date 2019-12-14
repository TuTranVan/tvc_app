<template>
  <div class="row" id="users-new">
    <div class="col-md-4">
      <h2>S I G N U P</h2>
      <hr>
      <b-form @submit="onSubmit" v-if="!auth">
        <b-form-group>
          <b-form-input
            v-model="user.full_name"
            type="text"
            required
            placeholder="Enter name"
          ></b-form-input>
        </b-form-group>

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

        <b-form-group>
          <b-form-input
            v-model="user.password_confirmation"
            type="password"
            required
            placeholder="Enter password_confirmation"
          ></b-form-input>
        </b-form-group>

        <b-form-group>
          <b-form-input
            v-model="user.phone"
            type="text"
            required
            placeholder="Enter phone"
          ></b-form-input>
        </b-form-group>

        <b-form-group>
          <b-form-input
            v-model="user.address"
            type="text"
            required
            placeholder="Enter Adress"
          ></b-form-input>
        </b-form-group>

        <b-button type="submit" variant="primary">Sign up</b-button>
      </b-form>
      <div v-else>
        <b class="text-success">{{ auth.full_name }} logged in system</b>
      </div>
      <hr>
      <ul class="text-danger">
        <li v-for="(error, index) of errors" :key="index">
          <p v-for="(value, idx) of error" :key="idx">{{ index | capitalize }} {{ value }}</p>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    data() {
      return {
        user: {
          full_name: "",
          email: "",
          password: "",
          password_confirmation: "",
          phone: "",
          address: ""
        },
        errors: [],
        auth: ""
      }
    },
    mounted() {
      if (localStorage.getItem("auth")) {
        try {
          this.auth = JSON.parse(localStorage.getItem("auth"));
        } catch(e) {
          localStorage.removeItem("auth");
        }
      }
    },
    filters: {
      capitalize: function(value) {
        return value.charAt(0).toUpperCase() + value.slice(1)
      }
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        axios({
          method: "post",
          url: window.location.pathname,
          data: { user: this.user }
        })
        .then(response => {
          this.errors = null
          this.auth = response.data.auth;
          localStorage.setItem("auth", JSON.stringify(response.data.auth))
        })
        .catch(error => {
          this.errors = error.response.data.errors
        });
      }
    }
  }
</script>
