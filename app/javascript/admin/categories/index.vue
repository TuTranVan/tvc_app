<template>
  <div>
    <h1>Categories</h1>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Name</th>
          <th scope="col">Parent</th>
        </tr>
      </thead>
      <tbody v-for="(category, index) in categories">
        <tr>
          <th scope="row">{{category.id}}</th>
          <td>{{category.name}}</td>
          <td>{{category.parent}}</td>
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
        categories: state => state.admin_category_index.categories
      })
    },
    mounted: function() {
      this.$store.dispatch('admin_category_index/getCategories')
    }
  }
</script>
