#spec homes controller
class HomesController < ApplicationController
  def show
    @posts = Post.all
  # Homes Controller
  end
end
