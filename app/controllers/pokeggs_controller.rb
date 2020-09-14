class PokeggsController < ApplicationController

  def index
    @pokeggs = Pokegg.all
    @pokeggs = policy_scope(@pokeggs)
  end

  def show
    @user = current_user
    @pokegg = Pokegg.all.find(params["id"])
    authorize @pokegg
  end

  def new
    @pokegg = Pokegg.new
    authorize @pokegg
  end

  def create
    @pokegg = Pokegg.new(pokegg_params)
    @pokegg.user = current_user
    authorize @pokegg
    @pokegg.save!
    redirect_to pokeggs_path
  end

  def edit
    @pokegg = Pokegg.find(params[:id])
    authorize @pokegg
  end

  def update
    @pokegg = Pokegg.find(params[:id])
    @pokegg.update(pokegg_params)
    authorize @pokegg
    redirect_to pokegg_path(@pokegg)
  end

  def destroy
    @pokegg = Pokegg.find(params[:id])
    authorize @pokegg
    @pokegg.destroy
    redirect_to pokeggs_path
  end

  private

   def pokegg_params
    params.require(:pokegg).permit(:name, :category, :region, :birthday, :state, :price, :available, :photo)
  end

end
