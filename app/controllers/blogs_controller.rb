require 'securerandom'

class BlogsController < ApplicationController
  
  def create 
    blog = Blog.new
    blog.title = params[:title]
    blog.name = params[:name]
    blog.desc = params[:desc]

    img_url = img_url = blog.save_image(params[:image]) if params[:image].present?
    blog.img = img_url 
    if blog.save 
      render json: {message: 'New created successfully ! ', name: blog.name, url: blog.img}, status: :ok
    else
      render json: {error: 'failed to create blog'}
    end 

  end

  
  def all 
    
  end 

  def search 

  end 



end
