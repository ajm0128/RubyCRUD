class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:create,:destroy,:update,:reply_create,:reply_update,:comment_destroy]
  def index
    @posts = Post.all
    flash[:alert] = '로그인이 필요합니다.'
  end

  def create
  # @post = Post.new
  # @post.title = params[:title]
  # @post.content = params[:content]
  # @post.save
    @user = User.find(current_user.id)
    @post = @user.posts.new(title:params[:title],content:params[:content])

    @imgUploader = ImgUploader.new
    @imgUploader.store!(params[:img])
    @post.img_url = @imgUploader.url
    @post.save
    # @post = Post.create(title:params[:title],content:params[:content])
  redirect_to '/'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all
    @post.destroy

    redirect_to '/'
  end

  def read
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])


  end

  def real_update
    @post = Post.find(params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    redirect_to '/'
  end

  def write
  # redirect_to '/home/write'
  end
  def comment_create
    @user = User.find(current_user_id)
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(post_id:params[:post_id])
    @comment.save
    redirect_to :back
  end
  def comment_destroy
    @comment = Comment.find(params[:post_id])
    @post = Post.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  def reply_create
    @user = User.find(current_user)
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(post_id:params[:post_id], title:params[:title])
    @comment.save
    redirect_to :back
  end

  def reply_update
    @comment = Comment.find(params[:post_id])
    @post = Post.find(params[:id])
  end
  def reply_real_update
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:post_id])
    @comment.title = params[:title]
    @comment.save
    redirect_to '/home/read/' + @post.id.to_s
  end

end
