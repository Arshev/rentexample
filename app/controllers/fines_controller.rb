class FinesController < ApplicationController
  before_filter :order_for_fines, only: [:index, :show, :create]

  def index
    @fines = Fine.where(order: @order)
  end

  def show
    @fine = Fine.find(params[:id])
  end

  def new
    @fine = Fine.new
  end

  def create
    reason = params.require(:fine)[:reason]
    cost = params.require(:fine)[:cost]
    @fine = Fine.create(reason: reason, cost: cost, order: @order)
    if @fine.errors.empty?
      redirect_to fine_path(@fine)
    else
      render new_fine_path(@fine)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def order_for_fines
    @order = Order.find(params[:id])
  end
end
