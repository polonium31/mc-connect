class CommentPostsController < ApplicationController
  before_action :set_post
  before_action :set_comment_post, only: [:show]

  # GET /posts/:post_id/comment_posts/1
  def show
  end

  # GET /posts/:post_id/comment_posts/new
  def new
    @comment_post = @post.comment_posts.build
  end

  # POST /posts/:post_id/comment_posts
  def create
    @comment_post = @post.comment_posts.build(comment_post_params)
    @comment_post.user = current_user
  
    if @comment_post.save
      redirect_to @post, notice: 'Comment post was successfully created.'
    else
      redirect_to @post
    end
  end

  # GET /posts/:post_id/comments
  def index
    @comments = @post.comment_posts
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
