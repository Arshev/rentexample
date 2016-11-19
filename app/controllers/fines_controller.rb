class FinesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @fine = Fine.new
    @order = Order.where(id: params[:id]).first
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
