class UsersController < ApplicationController
  before_action :authenticate_user!, :authenticate_owner!
  expose(:user)
  expose_decorated(:reviews, ancestor: :user) { |r| r.order('created_at DESC') }

  def show
  end


  private
    def authenticate_owner!
      unless user == current_user || current_user.admin?
        redirect_to root_path, notice: 'You are not allowed to view this resource.'
      end
    end

end