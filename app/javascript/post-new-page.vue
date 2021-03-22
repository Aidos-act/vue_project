<template>
	<post-form-panel :errors="errors" :post="post" @submit="createPost"></post-form-panel>
</template>

<script>
	import axios from 'axios';

	import PostFormPanel from 'post-form-panel.vue';

	export default {
		components: {
			PostFormPanel
		},
		data: function () {
			return {
				post: {
					title: '',
					body: ''
				},
				errors: ''
			}
		},
		methods: {
			createPost: function () {
				axios
					.post ('/api/v1/posts/', this.post)
					.then (response => { let e = response.data;
						this.$router.push ({ name: 'PostDetailPage', params: {id: e.id } }); 
						})
			}
		}
	}
</script>

<style scoped >
	
</style>