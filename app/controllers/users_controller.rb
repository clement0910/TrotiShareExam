class UsersController < ApplicationController
  def profile
    @user = current_user
    @scooters = Scooter.where(user_id: @user.id)
  end
end
