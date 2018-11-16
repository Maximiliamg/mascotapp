class CommmentsController < ApplicationController
  before_action :set_commment, only: [:show, :destroy]
  before_action :set_product, only: [:index, :create]
  skip_before_action :get_current_user, only: [:index, :show]

  # GET /commments
  def index
    render json: @product.commments
  end
  
  def index_user
    render_ok @current_user.commments
  end

  # GET /commments/1
  def show
    render_ok @commment
  end

  # POST /commments
  def create
    commment = Commment.new(user_id:@current_user.id, product_id:params[:product_id], commment:params[:commment])
    save_and_render commment
  end

  # DELETE /commments/1
  def destroy
    if @commment.user_id == @current_user.id
      render_ok @commment.destroy
    elsif is_current_user_admin.nil?
      render_ok @commment.destroy
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_commment
    @commment = Commment.find(params[:id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
