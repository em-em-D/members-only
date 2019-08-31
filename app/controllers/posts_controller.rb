class PostsController < ApplicationController
    before_action :sign_in?, only: %i[new create destroy]

    def index
        @posts = Post.all
    end

    def new
        @post = current_user.posts.build
    end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "Post successfully created"
            redirect_to postlist_path
        else
            flash.now[:error] = "Unable to create post"
            redirect_to '/login'
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash.now[:notice] = "Post has been deleted"
        redirect_to '/postboard'
    end

    private

    def post_params
        params.require(:post).permit(:content)
    end

    

end
