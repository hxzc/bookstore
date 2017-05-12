class AdminController < ApplicationController
  def index
  	@time = Time.now
  	@total_orders = Order.count
  	@hx = User.find(session[:user_id])
  	@admin_path = "/"+self.controller_path().to_s
  end
end
