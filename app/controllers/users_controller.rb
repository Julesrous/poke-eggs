class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.all.find(params["id"])
    @pokeggs = @user.pokeggs
    authorize @user
  end
end
