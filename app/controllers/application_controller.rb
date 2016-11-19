class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def render_404
    render file: 'public/404.html', status: 404
  end

  def render_403
    render file: 'public/403.html', status: 403
  end

  def check_if_admin
    render_403 unless @user.admin?
  end

  def get_user
    @user = RentUser.where(:name =>session['name']).first
  end
end
