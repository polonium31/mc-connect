class CommentPostsController < ApplicationController
    before_action :set_post
    before_action :set_comment_post, only: [:show, :edit, :update, :destroy]
  
    # GET /posts/:post_id/comment_posts
    def index
      @comment_posts = @post.comment_posts
    end
  
    # GET /posts/:post_id/comment_posts/1
    def show
    end
  
    # GET /posts/:post_id/comment_posts/new
    def new
      @comment_post = @post.comment_posts.build
    end
  
    # GET /posts/:post_id/comment_posts/1/edit
    def edit
    end
  
    # POST /posts/:post_id/comment_posts
    def create
      @comment_post = @post.comment_posts.build(comment_post_params)
  
      if @comment_post.save
        redirect_to post_comment_posts_path(@post), notice: 'Comment post was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /posts/:post_id/comment_posts/1
    def update
      if @comment_post.update(comment_post_params)
        redirect_to post_comment_posts_path(@post), notice: 'Comment post was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /posts/:post_id/comment_posts/1
    def destroy
      @comment_post.destroy
      redirect_to post_comment_posts_path(@post), notice: 'Comment post was successfully destroyed.'
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:post_id])
      end
  
      def set_comment_post
        @comment_post = @post.comment_posts.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def comment_post_params
        params.require(:comment_post).permit(:content)
      end
  end
  