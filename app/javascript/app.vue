<template>
  <div>
    <router-view></router-view>
  </div>
</template>

<script>
  import Vue from 'vue'
  import VueRouter from 'vue-router'

  import PostIndexPage from 'post-index-page.vue'
  import PostDetailPage from 'post-detail-page.vue'
  import PostNewPage from 'post-new-page.vue'
  import PostEditPage from 'post-edit-page.vue'

  const router = new VueRouter ({
    routes: [

    { path: '/', 
      component: PostIndexPage },

    { path: '/posts/:id(\\d+)', 
      name: 'PostDetailPage',
      component: PostDetailPage },
      
    { path: '/posts/new', 
      name: 'PostNewPage',
      component: PostNewPage },

    { path: '/posts/:id(\\d+)/edit',
      name: 'PostEditPage',
      component: PostEditPage },

    { path: '/',
      name: 'PostIndexPage',
      component: PostIndexPage }

    ]

  })

  Vue.use(VueRouter)

  export default {
    router
  }
</script>

<style scoped>
</style>
