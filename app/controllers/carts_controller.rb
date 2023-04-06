class CartsController < ApplicationController
  def show
    @cart = Cart.find(session[:cart_id])
  end

  def add_to_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    @ram = Ram.find(params[:ram_id])
    @cart.add_ram(@ram)

    session[:cart_id] = @cart.id

    redirect_to cart_path
  end

  def remove_from_cart
    product = Product.find(params[:product_id])
    @cart = Cart.find(session[:cart_id])
    @cart.remove_product(product)
    redirect_to cart_path
  end

  def update_cart
    @cart = Cart.find(session[:cart_id])
    @cart.update_cart(params[:cart])
    redirect_to cart_path
  end
end
