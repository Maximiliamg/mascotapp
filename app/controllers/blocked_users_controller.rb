class BlockedUsersController < ApplicationController
  before_action :set_blocked_user, only: [:show, :update, :destroy]

  # GET /blocked_users
  def index
    @blocked_users = BlockedUser.all

    render json: @blocked_users
  end

  # GET /blocked_users/1
  def show
    render json: @blocked_user
  end

  # POST /blocked_users
  def create
    @blocked_user = BlockedUser.new(blocked_user_params)

    if @blocked_user.save
      render json: @blocked_user, status: :created, location: @blocked_user
    else
      render json: @blocked_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blocked_users/1
  def update
    if @blocked_user.update(blocked_user_params)
      render json: @blocked_user
    else
      render json: @blocked_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blocked_users/1
  def destroy
    @blocked_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blocked_user
      @blocked_user = BlockedUser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blocked_user_params
      params.require(:blocked_user).permit(:user_id)
    end
end
