class DashboardsController < ApplicationController
  before_action :check_for_admin, only: [:show]
  before_action :authenticate_user!, only: [:bookmarks]

  #Dashboard controller
  def show
    if user_signed_in?
      @dashboard = Dashboard.new(user: current_user, posts: feed)
    else
      @dashboard = Dashboard.new(posts: featured_posts)
    end
  end

  def bookmarks
    @dashboard = Dashboard.new(user: current_user, posts: bookmarked_posts, filter: :bookmarks)
    respond_to do |format|
      format.html { render :show }
      format.js   { render :show }
    end
  end

  def top_bonga
    if user_signed_in?
      @dashboard = Dashboard.new(user: current_user, posts: top_posts, filter: :top_bonga)
    else
      @dashboard = Dashboard.new(posts: top_posts, filter: :top_bonga)
    end
    respond_to do |format|
      format.html { render :show }
      format.js   { render :show }
    end
  end

  private

    def check_for_admin
      redirect_to admin_dashboard_url if admin_signed_in?
    end

    def feed
      Feed.new(current_user, page: params[:page])
    end

    def bookmarked_posts
      current_user.bookmarked_posts.published.includes(:user).paginate(page: params[:page])
    end

    def top_posts
      Post.published.top_bonga(5).includes(:user)
    end

    def recent_posts
      Post.published.recent.includes(:user).paginate(page: params[:page])
    end

    def featured_posts
      Post.recent.featured.includes(:user).paginate(page: params[:page])
    end

end
