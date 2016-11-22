class LoginController < ApplicationController
  def index
  end

  def sign_in
    rent_user = RentUser.where(:name =>params['name'], :password => params['password']).first
    if rent_user.nil?
      redirect_to :root
    else
      session[:name] = rent_user.name
      if rent_user.admin?
        redirect_to adminka_index_path
      else
        redirect_to orders_path
      end
    end
  end
end
