class LineItemsController < ApplicationController
    def create
        @component = Component.find(params[:component_id])
          
        if current_user.cart.nil?
            current_user.create_cart
        end
          
        current_user.cart.line_items.create(component: @component, quantity: 1)     
        redirect_back(fallback_location: root_path) 
    end

    def destroy
        @line_item = LineItem.find(params[:id])
        @line_item.destroy
        respond_to do |format|
          format.html { redirect_to carts_path, notice: 'Товар удален из корзины' }
          format.js { render js: "document.getElementById('line_item_#{params[:id]}').remove();" }
        end
    end

    def update
        @line_item = LineItem.find(params[:id])
        if @line_item.update(line_item_params)
          respond_to do |format|
            format.html { redirect_to carts_path, notice: 'Количество товара в корзине обновлено' }
            format.js { render 'update', locals: { line_item: @line_item } }
          end
        else
          render :edit
        end
    end    

    private

    def line_item_params
        params.require(:line_item).permit(:quantity)
    end
end
