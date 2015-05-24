class PostsController < ApplicationController
	before_action :logged_in?, only: [:new, :create]

	def new
		@post = Post.new
	end

	def create
		#create post using post_params
		#call save, if valid flash success and redirect to index
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			flash[:success] = "Post success"
			redirect_to posts_path
		else
			render 'new'
		end

	end

	def index
		@posts = Post.all.order('created_at DESC')
	end

	private
		def post_params
			params.require(:post).permit(:body)
		end
end