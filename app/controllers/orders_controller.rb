class OrdersController < ApplicationController

  def index
    @orders = Order.all 
  end

  def new
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
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

  def delete
    @order = Order.find(parms[:id])
    @order.destroy
    render :new
  end
  

  private
   
    def order_params
      params.require(:order).permit!
    end
end
