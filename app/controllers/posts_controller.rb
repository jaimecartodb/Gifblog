class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
		@post.save
		redirect_to '/posts'
	end

	def show
		@post = Post.find_by(id: params[:id])
	end

	def increase_posts
		@post = Post.find_by(id: params[:id])
		@post.increment(:num_votes)
		@post.save
	end

	private
	def post_params
		return params.require(:post).permit(:title, :gif)
	end
end
