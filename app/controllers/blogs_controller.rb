class BlogsController < ApplicationController
  before_filter :authenticate_admin!, only: [ :new, :create, :destroy, :edit, :update]
  def index
    @blogs = Blog.all
    respond_with(@blogs)
  end

  def show
    @blog = Blog.find(params[:id])
    respond_with(@blog)
  end

  def new
    @blog = Blog.new
    respond_with(@blog)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:blog])
    @blog.save
    respond_with(@blog)
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update_attributes(params[:blog])
    respond_with(@blog)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    respond_with(@blog)
  end
end
