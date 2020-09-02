class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save

    redirect_to post_path(@post)
    else
      render :'posts/new'
    end
  end

  def update
    @post.update(post_params)

    if @post.valid?
      redirect_to post_path(@post)
    else
      render :'posts/edit'
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
