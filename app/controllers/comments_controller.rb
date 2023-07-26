class CommentsController < ApplicationController

    def blog_comments
      @blog_id = params[:blog_id]
      @parent_id = params[:parent_id]
    
      if params[:parent_id]=="0"
          @comments = Comment.where(parent_id: nil, blog_id: @blog_id)
      else
          @comments = Comment.find(params[:parent_id]).replies
      end

    end

    def create 
      if params[:parent_id]=="0"
          blog = Blog.find(params[:blog_id])
          blog.comments.create(text: params[:comment])
      else
          parent= Comment.find(params[:parent_id])
          parent.replies.create(text: params[:comment], blog_id: parent.blog_id)
      end
      redirect_to "/blogs/#{params[:blog_id]}/comments/#{params[:parent_id]}"
    end
    
    def remove


    end

end
