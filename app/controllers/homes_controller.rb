class HomesController < ApplicationController
  def show
  	@post = Post.all
  end
end
