class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :set_latest_blog, only: %i[index show]
  def index
    @blogs = policy_scope(Blog).order(created_at: :desc)
    # search bar
    if params[:query].present?
      sql_query = " \
        blogs.title @@ :query \
        OR blogs.body @@ :query \
        OR blogs.subject @@ :query \
      "
      @blogs = Blog.where(sql_query, query: "%#{params[:query]}%")
    else
      @blogs = Blog.all.reverse_order
    end
  end

  def show
    authorize(@blog)
    @blog = Blog.find(params[:id])
    set_meta_tag title: @blog.title
  end

  def new
    @blog = Blog.new
    respond_to do |format|
      format.js
    end
    authorize(@blog)
  end

  def edit
    respond_to do |format|
      format.js
    end
    authorize(@blog)
  end

  def create
    @blog = Blog.new(blog_params)
    @user = current_user
    @blog.user = @user
    authorize @blog
    if @blog.save
      redirect_to blogs_path
    else
      render :new
    end
  end

  def update
    authorize(@blog)
    @blog.update(blog_params)
    if @blog.save
      redirect_to blogs_path(@blog)
    else
      render :edit
    end
  end

  def destroy
    authorize(@blog)
    @blog.destroy
    redirect_to blogs_url
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_latest_blog
    @latest_blogs = Blog.order(:created_at).reverse_order.limit(5)
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :subject, :user_id, :photo)
  end
end
