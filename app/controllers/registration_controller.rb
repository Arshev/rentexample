class RegistrationController < ApplicationController
  def index
    @rent_user = RentUser.new
  end

  def create
    @rent_user = RentUser.new(user_params)
    @rent_user.role = Role.where(:role => 2).first
    if @rent_user.save
      redirect_to :root
      @rent_user = nil
    end
  end

  private
  def user_params()
    params.require(:rent_user).permit(:name, :email, :password)
  end
end
