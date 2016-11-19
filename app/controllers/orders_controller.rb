class OrdersController < ApplicationController
  include OrdersHelper
  before_filter :get_user
  before_filter :find_order, only: [:show, :edit, :update]
  before_filter :check_if_admin, only: [:index, :edit, :update]


  def index
    @order_statuses = order_statuses
    @active_orders = active_orders
    @completed_orders = completed_orders
    if params[:status].nil?
      @orders = Order.all
      total_prices
    elsif OrderStatus.find(params[:status]).description == 'All'
      @orders = Order.all
      total_prices
      render :partial => "orders", :object => @orders
    else
      @orders = Order.where(:status => params[:status])
      total_prices
      render :partial => "orders", :object => @orders
    end
  end

  def return_car

  end

  def show
  end

  def new
    @order = Order.new
    @available_cars = available_cars
  end

  def create
    client = current_user
    admin = get_admin
    status = OrderStatus.find(1)
    params = order_params.merge({:client => client, :admin => admin, :status => status})
    @order = Order.create(params)
    if @order.errors.empty?
      car = params[:car]
      car.update_attributes(:status => CarStatus.where(:description => 'Ordered').first)
      redirect_to order_path(@order)
    else
      @available_cars = available_cars
      render new_order_path
    end
  end

  def edit
    @order_statuses = order_statuses
    @car_conditions = car_conditions
  end

  def update
    o_comment = params.require(:order)[:comment]
    new_status = OrderStatus.find(params.require(:order)[:status])
    new_params = {:comment => o_comment, :status => new_status}
    @order.update_attributes(new_params)
    if @order.errors.empty?
      car = @order.car
      car_status = get_new_car_status(new_status)
      car_condition = CarCondition.find(params[:condition])
      car.update_attributes(:status => car_status, :condition => car_condition)
      redirect_to order_path(@order)
    else
      render edit_order_path(@order)
    end

  end

  def destroy
  end

  private
  def order_params
    car_id = params.require(:order)[:car]
    car = Car.find(car_id)
    passport = params.require(:order)[:passport]
    rent_time = params.require(:order)[:rent_time]
    {:car => car, :passport => passport, :rent_time => rent_time}
  end

  def total_prices
    prices = []
    @orders.each { |order| prices << order.car.price * order.rent_time }
    @total_prices = prices.reduce(:+)
  end

  def find_order
    @order = Order.where(id: params[:id]).first
    render_404 unless @order
  end

  def get_new_car_status(order_status)
    if OrderStatus.where(:description => ['Completed', 'Declined']).include? order_status
      CarStatus.where(:description => 'Available For Rent').first
    elsif OrderStatus.where(:description => ['Approved', 'In Progress', 'Car returned']).include? order_status
      CarStatus.where(:description => 'In Rent').first
    elsif OrderStatus.where(:description => ['Received']).include? order_status
      CarStatus.where(:description => 'Ordered').first
    end
  end

  def active_orders
    OrderStatus.where(:description => ['Received', 'Approved', 'In Progress', 'Car returned'])
  end

  def completed_orders
    OrderStatus.where(:description => ['Completed'])
  end

  def get_admin
    RentUser.where(:role => Role.find(1)).first
  end

  def current_user
    RentUser.where(:name => session[:name]).first
  end
end
