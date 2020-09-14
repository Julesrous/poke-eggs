class PaymentsController < ApplicationController
  def new
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    @pokegg = @order.pokegg
    authorize @order
  end
end
