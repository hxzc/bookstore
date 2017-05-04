#coding:utf-8
class SessionController < ApplicationController
  def new
  end

  def create
  	if user = User.authenticate(params[:name],params[:password])
  	  session[:user_id] = user.id
  	  redirect_to admin_url
  	else
  	  redirect_to login_url,alert:"用户名或密码错误"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, notice:"已退出"
  end
end
