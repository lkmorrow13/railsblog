class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to @comment.post
  end

  def edit
    @comment = current_user.comments.find(params[:id])
    
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    redirect_to @comment.post
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to root_path
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :url, :post_id)
  end
end
