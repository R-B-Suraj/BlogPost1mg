require 'securerandom'



class BlogsController < ApplicationController
  
  before_action :authenticate_user!, except: [:all, :index]


  def index
    @blog_count= Blog.where(deleted:0).size
  end
  


  def create 

    @blog = Blog.new
    @blog.title = params[:title]
    @blog.desc = params[:desc]
    @blog.user_id = current_user.id
    img_url = @blog.save_image(params[:image]) if params[:image].present?
    @blog.img = img_url 

    if @blog.save 
      redirect_to "/blogs/all"
    else
      render :write 
    end 

  end
  


  def all 
    if params[:user_id]
      @all_blogs = Blog.where(deleted:0, user_id: params[:user_id]).reverse_order
    else
      @all_blogs = Blog.where(deleted: 0).reverse_order
    end
  end 



  def delete 

    post = Blog.find(params[:id])
    if(post.user_id == current_user.id)
      # post.destroy
      post.update(deleted: 1)
      redirect_to "/blogs/all"
    else
      render json:{error: "You are not the owner of this post."}
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

  def edit 
    id = params[:id]
    if Blog.exists?(id)
      @blog = Blog.where(deleted:0,id:id)[0]
      render :edit
    else
      render json:{error:{message: "resource not found"}}
    end
  end

  def update 
    @blog = Blog.find(params[:id])
    
    img_url = @blog.save_image(params[:image]) if params[:image].present?
    
    if @blog.update({title: params[:title], desc: params[:desc], user_id:current_user.id, img:img_url}) 
      redirect_to "/blogs/all"
    else
      render :write
    end
  end

end
