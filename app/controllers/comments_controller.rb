class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def index
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'Comments is created successfully!'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Comments can not be created SUccessfully!'
      redirect_to post_path(@post)
    end
  end
  
  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  # def edit
  #   @comment = @post.comments.find(params[:id])
  # end
  
  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_url(@post), notice: "Comment Updated Successfully!" }
      else
        format.html { redirect_to post_url(@post), alert: "Comment was not updated Successfully!" }
      end
    end
  end
  
  private
  
  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
