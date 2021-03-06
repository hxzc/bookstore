#coding:utf-8
class ApplicationController < ActionController::Base
  before_filter :authorize,:set_i18n_locale_form_params
  protect_from_forgery
  private
    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
	    session[:cart_id] = cart.id
	    cart
	  end

  protected
    def authorize
      unless User.find_by_id(session[:user_id])
      	redirect_to login_url, notice:"请登陆"
      end
    end
    def set_i18n_locale_form_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]}"
          logger.error flash.now[:notice]
        end
      end
    end
    def default_url_options
      {locale:I18n.locale}
    end
end
