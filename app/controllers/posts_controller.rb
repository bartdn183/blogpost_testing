class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show

	end

	def edit

	end

	def create
		@post = Post.new(post_params)

		respond_to do |format|
			if @post.save
				format.html { redirect_to post_path(@post)}
			else
				format.html { render :new}
			end
		end

	end

	def update
		respond_to do |format| 
			if @post.update(post_params)
				format.html { redirect_to post_path(@post)}
			else
				format.html { render :edit}
			end
		end
	end

	def destroy
	  if @post.destroy
	  	respond_to do |format|
	  		format.html { redirect_to posts_path}
	  	end
	  end
	end

	private

	def post_params
		params.require(:post).permit(:title, :article, :user_id)
	end

	def set_post
		@post = Post.find(params[:id])
	end
end
