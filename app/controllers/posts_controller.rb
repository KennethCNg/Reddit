class PostsController < ApplicationController
    before_action :verify_poster, only: [:edit, :update, :destroy]

    def new
        post = Post.new
    end

    def create
        post = current_user.posts.new(post_params)
        if post.save
            redirect_to post_url(post)
        else
            flash.now[:errors] = post.errors.full_messages
        end
    end

    def show
        post = Post.find(params[:id])
    end

    def edit
        post = Post.find(params[:id])
    end


    def update
        post = Post.find(params[:id])
        if post.update
            redirect_to subs_url(post)
        else
            flash.now[:errors] = post.errors.full_messages
            render :edit
        end
    end

    
    def destroy
        post = post.find(params[:id])
        if post.destroy
            redirect_to subs_url(post)
        else
            flash.now[:errors] = post.errors.full_messages
            render :index
        end
    end

    

    private
    
    def post_params
        params.require(:posts).permit(:title, :url, :content, sub_ids: [])
    end
end
