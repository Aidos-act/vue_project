class Api::V1::PostsController < ApiController
	before_action :set_post, only:[:show, :edit, :update, :destroy]


	def index
		posts = Post.all
		render json:posts
	end

	def show
		render json:@post
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			render json: @post, status: :created
		else
			render json: { errors: post.errors.full_messages}, status: :unprocessable_enitity
		end
	end

	def new
		@post = Post.new
	end

	def update
		if @post.update(post_params)
			head :no_content
		else
			render json: { errors: @post.errors.full_messages }, status: :unprocessable_enitity
		end
	end

	def destroy
		@post.destroy
		head :no_content
	end


	private 

		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:title, :body)
		end
end