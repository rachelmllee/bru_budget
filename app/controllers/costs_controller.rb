class CostsController < ApplicationController
  def index
      @user = current_user
      @costs = @user.costs
  end

  def show
      @user = current_user
      @cost = @user.costs.find(params[:id])
  end

  def new
      @user = current_user
      @cost = @user.costs.new
  end

  def edit
      @user = current_user
      @cost = @user.costs.find(params[:id])
  end

  def create
      @user = current_user
      @cost = @user.costs.build(cost_params)

      if @cost.save
        redirect_to user_costs_path(@user)
      else
        render 'new'
      end
  end

  def update
      @user = current_user
      @cost = @user.costs.find(params[:id])

      if @cost.update(cost_params)
        redirect_to user_costs_path(@user)
      else
        render 'edit'
      end
  end

  def destroy
      @user = current_user
      @cost = @user.costs.find(params[:id])
      @cost.destroy
      redirect_to user_costs_path(@user)
    end

  private
      def cost_params
        params.require(:cost).permit(:item, :cost, :user_id)
      end
end