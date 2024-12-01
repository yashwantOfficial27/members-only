class PostsController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]  
  before_action :authenticate_user!, except: %i[index show]  # %i creates an array of symbols

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: 'post was created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to post_path, notice: "Updated Successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, notice: "Post is successfully deleted!"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
