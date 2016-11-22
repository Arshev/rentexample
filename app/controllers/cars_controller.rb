class CarsController < ApplicationController
  def index
    car_id = params['car']
    if car_id.nil? || car_id == ''
      @car = nil
      respond_to do |format|
        format.html {render :partial => "price", :object => "Select a Car to see price"}
      end
    else
      @car = Car.find(car_id)
      render :partial => "price", :object => @car
    end
  end
end
