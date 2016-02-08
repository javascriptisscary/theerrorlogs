class WelcomeController < ApplicationController
  def index
    @posts = Post.last(5)
  end
end
