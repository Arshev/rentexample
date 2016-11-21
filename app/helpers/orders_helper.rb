module OrdersHelper
  ORDER_STATUS = OrderStatus.all.collect{|os| [os.description, os.id]}
  AVAILABLE_CARS = Car.where(:status => CarStatus.find(1))#.collect { |p| [p.brand, p.id ] }.sort

  def available_cars
    Car.where(:status => CarStatus.find(1))
  end

  def car_conditions
    CarCondition.all
  end

  def order_statuses
    OrderStatus.order(:description)
  end
end
