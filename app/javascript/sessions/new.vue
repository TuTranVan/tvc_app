<template>
  <div class="row" id="sessions-new">
    <div class="col-md-4">
      <b-form @submit="onSubmit" v-if="!auth">
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
      <b class="text-success" v-else>{{ auth.full_name }} logged in system</b>
    </div>
  </div>
</template>

<script>
  import axios from "axios";
  export default {
    data() {
      return {
        user: {
          email: "",
          password: ""
        },
        auth: "",
        error: ""
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
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        axios({
          method: "post",
          url: window.location.pathname,
          data: { user: this.user },
          headers: {'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')}
        })
        .then(response => {
          this.error = null
          this.auth = response.data.auth;
          localStorage.setItem("auth", JSON.stringify(this.auth));
          localStorage.setItem("auth_token", JSON.stringify(response.data.auth_token));
        })
        .catch(error => {
          this.error = error.response.data.error
        });
      }
    }
  }
</script>
