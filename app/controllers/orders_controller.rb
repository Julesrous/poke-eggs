class OrdersController < ApplicationController
  def create
  pokegg = Pokegg.find(params[:pokegg_id])
  user = current_user
  if pokegg.region == user.region
    pokegg.price = pokegg.price.to_i + 10
    order  = Order.create!(pokegg: pokegg, amount: pokegg.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: pokegg.name,
        images: [pokegg.photo.key],
        amount: pokegg.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  authorize order
else
  pokegg.price = pokegg.price.to_i + 100
  order  = Order.create!(pokegg: pokegg, amount: pokegg.price, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: pokegg.name,
        images: [pokegg.photo.key],
        amount: pokegg.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  authorize order
  end
  end

def show
  @order = current_user.orders.find(params[:id])
  @pokegg = @order.pokegg
   @order.state = 'paid'
   @order.save
  if @order.state == 'paid'
    @pokegg.available = false
    @pokegg.save
  end
  authorize @order
end
end
