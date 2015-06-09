class UsersController < ApplicationController
  before_action :authenticate_user!
  expose(:user)
  expose_decorated(:reviews, ancestor: :user) { |r| r.order('created_at DESC') }
end