class Products::AdminsController < ApplicationController 
  before_action :is_current_user_admin
  before_action :set_product, only: [:block]

  def block
    block_product = BlockedProduct.new(product_id:params[:product_id].to_i, blocked_quantity:@product.stock)
    @product.update_attribute(:stock, 0)
    save_and_render block_product
  end

  def unblock
    block_product = BlockedProduct.where(product_id:params[:product_id].to_i).first
    if block_product
      render_ok block_product.destroy
    else
      render json: {authorization: 'product is not blocked'}, status: :unprocessable_entity
    end  
  end

  def index_block
    render_ok BlockedProduct.all
  end

  private
  def set_product
    @product = Product.find params[:product_id]
  end
end 