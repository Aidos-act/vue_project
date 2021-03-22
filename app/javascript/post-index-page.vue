<template>
  <div id="app">
    <h1> Posts </h1>
    <table>
      <tbody>
        <tr>
          <th> ID </th>
          <th> Title </th>        
          <th> Body </th>
          <th colspan="2"></th>
        </tr>
        <tr v-for="e in posts">
          <td> {{ e.id }} </td>
          <td> <router-link :to="{name: 'PostDetailPage', params: {id: e.id}}"> {{ e.title }} </router-link></td>
          <td> {{ e.body }}</td>
          <td> <button @click="deleteTarget=e.id; showModal=true"> Delete </button></td>
          <td><router-link :to="{name: 'PostEditPage', params: {id: e.id}}" tag="button"> Update </router-link> </td>
        </tr>
      </tbody>
    </table>
    <router-link :to="{name: 'PostNewPage'}" tag="button"> New Post </router-link> 
    <modal v-if="showModal" @cancel="showModal=false" @ok="deletePost(); showModal=false;">
      <div slot="body"> Are you sure? </div> 
    </modal>
  </div>
</template>

<script>
  import axios from 'axios';
  import Modal from 'modal.vue';
  export default {
    components: {
      Modal
    },
    data: function () {
      return {
        posts: [],
        showModal: false,
        deleteTarget: -1,
        errors: ''
      }
    },
    mounted () {
      this.updatePosts ();
      },
    methods: {
      deletePost: function () {
        if (this.deleteTarget <= 0) {
          console.warn('deleteTarget should not be greater than zero. ');
          return;
        }

        axios
          .delete('/api/v1/posts/' + this.deleteTarget)
          .then( response => {
            this.deleteTarget = -1;
            this.updatePosts();
          });
      },
      updatePosts: function () {
        axios
          .get('api/v1/posts.json')
          .then(response => (this.posts = response.data))
      }
    }
  }
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
