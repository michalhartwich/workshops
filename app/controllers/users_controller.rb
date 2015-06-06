class UsersController < ApplicationController

  expose(:user)
  expose_decorated(:reviews, ancestor: :user)

  def show
  end

end