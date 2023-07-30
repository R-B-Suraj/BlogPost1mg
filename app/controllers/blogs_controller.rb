require 'securerandom'

class BlogsController < ApplicationController
  
  before_action :authenticate_user!, only: [:create]


  def index
    @blog_count= Blog.where(deleted:0).size
  end
  
  def create 
  
    blog = Blog.new 
    blog.title = params[:title]
    blog.name = params[:name]
    blog.desc = params[:desc]

    img_url = img_url = blog.save_image(params[:image]) if params[:image].present?
    blog.img = img_url 
    if blog.save 
      redirect_to "/blogs/all"
    else
      render json: {error: 'failed to create blog'}
    end 

  end
  
  def all 
    @all_blogs = Blog.where(deleted: 0).reverse_order
  end 

  def delete 

    post = Blog.find(params[:id])
    if(post.name == params[:name])
      # post.destroy
      post.update(deleted: 1)
      redirect_to "/blogs/all"
    else
      render json:{error: "You are not the owner of this post.",parameter: {id: params[:id], name: params[:name]}, post:{id:post.id, name:post.name}}, status: :unauthorized 
    end

  end

  def blog 
    if Blog.exists?(params[:id])
      blog = Blog.find(params[:id])
      if(blog.deleted == 0)
        @blog = blog 
      else
        render json: {message: "the blog doesn't exist"}
      end
    else
      render json:{message: "the blog doesn't exist"}
    end
  end



end
