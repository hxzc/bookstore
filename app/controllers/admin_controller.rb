class AdminController < ApplicationController
  def index
  	@time = Time.now
  	@total_orders = Order.count
  	@hx = User.find(session[:user_id])
  end
end
