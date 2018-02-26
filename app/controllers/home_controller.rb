class HomeController < ApplicationController
  def index
  	if !user_signed_in?
  		redirect_to login_path
  	end
  	@posts = Post.all
  	@post = Post.new
  	@posts = Post.last(10).reverse
  end
end
