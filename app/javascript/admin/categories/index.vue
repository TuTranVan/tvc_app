<template>
  <div>
    <h1>Categories</h1>
    <div>
      <b-button v-b-toggle.add-category size="sm" variant="primary" @click="showFormNew">New +</b-button>
      <b-collapse id="add-category" class="mt-2">
        <b-form @submit="addCategory">
          <b-form-group>
            <b-form-input
              v-model="newCategory.name"
              type="text"
              placeholder="Enter name"
            ></b-form-input>
          </b-form-group>

          <b-form-group>
            <b-form-select
              v-model="newCategory.parent_id"
              :options="parents"
            ></b-form-select>
          </b-form-group>

          <hr>
          <ul class="text-danger">
            <li v-for="(error, index) of errors.create" :key="index">
              <p v-for="(value, idx) of error" :key="idx">{{ index | capitalize }} {{ value }}</p>
            </li>
          </ul>

          <b-button type="submit" variant="primary">Add</b-button>
        </b-form>
      </b-collapse>
    </div>
    <br>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Name</th>
          <th scope="col">Parent</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody v-for="(category, index) in categories">
        <tr>
          <th scope="row">{{category.id}}</th>
          <td>{{category.name}}</td>
          <td>{{category.parent}}</td>
          <td>
            <b-button variant="btn btn-outline-danger" @click="deleteCategory(category)">Delete</b-button>
            <b-button variant="outline-secondary" @click="showFormEdit(category)">Edit</b-button>
          </td>
        </tr>
      </tbody>
      <b-modal v-model="showEdit" :hide-footer="true">
        <b-form @submit="updateCategory">
          <b-form-group>
            <b-form-input
              v-model="editCategory.name"
              type="text"
              placeholder="Enter name"
            ></b-form-input>
          </b-form-group>

          <b-form-group>
            <b-form-select
              v-model="editCategory.parent_id"
              :options="parents"
            ></b-form-select>
          </b-form-group>

          <hr>
          <ul class="text-danger">
            <li v-for="(error, index) of errors.update" :key="index">
              <p v-for="(value, idx) of error" :key="idx">{{ index | capitalize }} {{ value }}</p>
            </li>
          </ul>

          <b-button type="submit" variant="primary">Update</b-button>
        </b-form>
      </b-modal>
    </table>
  </div>
</template>
<script>
  import { mapState } from 'vuex'

  export default {
    data() {
      return {
        parents: [],
        showEdit: false,
        editCategory: {}
      }
    },
    filters: {
      capitalize: function(value) {
        return value.charAt(0).toUpperCase() + value.slice(1)
      }
    },
    methods: {
      setParents(disableID = null){
        this.parents = [{value: null, text: 'Parent'}]
        this.categoriesParent.forEach(category => this.parents.push({ value: category.id, text: category.name, disabled: category.id == disableID }))
      },
      showFormNew(e){
        e.preventDefault()
        this.setParents()
      },
      addCategory(e){
        e.preventDefault();
        this.$store.dispatch('admin_category_index/addCategory')
      },
      showFormEdit(category){
        this.$store.dispatch('admin_category_index/editCategory', category)
        this.setParents(category.id)
        this.editCategory = {}
        this.showEdit = true
      },
      updateCategory(e){
        e.preventDefault();
        this.$store.dispatch('admin_category_index/updateCategory', this.editCategory)
      },
      deleteCategory(category){
        if (confirm("Do you want to delete?")) {
          this.$store.dispatch('admin_category_index/deleteCategory', category)
        }
      }
    },
    computed: {
      ...mapState({
        categories: state => state.admin_category_index.categories,
        newCategory: state => state.admin_category_index.newCategory,
        errors: state => state.admin_category_index.errors
      }),
      categoriesParent(){
        return this.$store.getters['admin_category_index/getCategoriesParent']
      }
    },
    mounted() {
      this.$store.dispatch('admin_category_index/getCategories')
    }
  }
</script>
