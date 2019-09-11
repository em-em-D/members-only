class PostsController < ApplicationController
  # frozen_string_literal: true
  before_action :sign_in?, only: %i[index new create destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to postlist_path
    else
      flash.now[:error] = 'Unable to create post'
      render '/login'
    end
  end

  def show
    @post = Post.find(params_id)
  end

  def destroy
    @post = Post.find(params_id)
    @post.destroy
    flash.now[:notice] = 'Post has been deleted'
    redirect_to '/postboard'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def params_id
    params.require(:post).permit(:id)
  end
end
