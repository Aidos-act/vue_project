<template>
	<form @submit.prevent = "$emit('submit')">
		<div v-if="errors.length!=0">
			<ul v-for="e in errors">
				<li> <font color="red"> {{ e }} </font></li>
			</ul>
		</div>
		<div>
			<label> Title </label>
			<input v-model="post.title" type="text">
		</div>
		<div>
			<label> Body </label>
			<input v-model="post.body" type="text">
		</div>
		<button type="submit"> Submit </button>
		<router-link :to="{name: 'PostIndexPage'}" tag="button"> Back </router-link>
	</form>
</template>
<script>
	export default {
		props: {
			post: {},
			errors: ''
		}
	}
</script>

<style scoped>
	
</style>