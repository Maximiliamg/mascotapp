class Users::AdminsController < ApplicationController 
  before_action :is_current_user_admin
  before_action :set_user, only: [:block]
  
  def block
    if !@user.tokens.nil?
      @user.tokens.map do |token| #.map is required to iterate through ActiveRecord::Associations::CollectionProxy element, it is not an array...
        token.destroy
      end
    end
    block = BlockedUser.new(user_id:params[:user_id].to_i)
    save_and_render block
  end

  def unblock
    block = BlockedUser.where(user_id:params[:user_id].to_i).first
    if block
      render_ok block.destroy
    else
      render json: {authorization: 'user is not blocked'}, status: :unprocessable_entity
    end  
  end

  def index_block
    render_ok BlockedUser.all
  end

  private 
  def set_user
    @user = User.find params[:user_id]
  end
end