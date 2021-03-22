<template>
	<post-form-panel :errors="errors" :post="post" @submit="updatePost"></post-form-panel>
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
				post: {},
				errors: ''
			}
		},
		mounted () {
			axios
				.get('/api/v1/posts/' + this.$route.params.id + '.json')
				.then(response => (this.post = response.data))
		},
		methods: {
			updatePost: function () {
				axios
					.patch('/api/v1/posts/' + this.post.id, this.post)
					.then (response => {
						this.$router.push ({ name: 'PostDetailPage', params: {id: this.post.id } }); 
						})
			}
		}
	}
</script>

<style scoped >
	
</style>