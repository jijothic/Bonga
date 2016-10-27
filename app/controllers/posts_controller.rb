class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end
# create new post
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end

  private

  def post_params
      params.require(:post).permit(:title, :body, :all_tags)
    end

    def post_params_residu

    end
end
