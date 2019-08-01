class OrdersController < ApplicationController

  def index
    @orders = Order.all 
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @order_items = current_order.order_items
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to order_path
    else
      render :new
    end
  end

  def edit
    @order = Order.find(order_params)
  end


  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.valid?
      @order.save
      redirect_to order_path
    else
      render :show
    end
  end

  def destroy
    @order = Order.find_by(user_id: session[:user_id])
    @order.destroy
    render root_path
  end
  

  private
   
    def order_params
      params.require(:order).permit!
    end
end
