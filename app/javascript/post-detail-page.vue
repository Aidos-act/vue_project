<template>
	<dl>
		<h1> Posts Detail </h1> 
		<dt> ID </dt>
		<dd> {{ post.id }} </dd>
		<dt> Title </dt>
		<dd> {{ post.title }} </dd>
		<dt> Body </dt>
		<dd> {{ post.body }} </dd>
		<dt> Created </dt>
		<dd> {{ post.created_at }} </dd>
		<dd><router-link :to="{name: 'PostIndexPage'}" tag="button"> Back </router-link></dd>
	</dl>
</template>


<script>
	import axios from 'axios';

	export default {
		data: function () {
			return {
				post: {}
			}
		},
		mounted () {
			axios
				.get('/api/v1/posts/' + this.$route.params.id + '.json')
				.then(response => (this.post = response.data))
		}
	}
</script>

<style scoped >
</style>
