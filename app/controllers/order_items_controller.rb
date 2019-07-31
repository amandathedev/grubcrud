class OrderItemsController < ApplicationController

    def new
        
    end

  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    # @order.save
    

    if @order.valid?
      @order.save
      session[:order_id] = @order.id
      redirect_to root_path
    else
      errors = @order.errors.full_messages
      flash[:errors] = errors  
      render :new
    end

  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  def show
    @order_item = OrderItem.find
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :item_id)
  end
  
end
