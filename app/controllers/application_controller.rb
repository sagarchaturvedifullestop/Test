class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :activ_link

  enable_authorization do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def user_for_paper_trail
    current_user && current_user.id
  end

  def current_user
  #  @current_user ||= User.find_by_token(cookies[:token]) if cookies[:token]
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def redirect_to_target_or_default(default, *options)
    redirect_to(session[:return_to] || default, *options)
    session[:return_to] = nil
  end

  def store_target_location
    session[:return_to] = request.url
  end
  
  def activ_link (name)
    #raise params.to_yaml
    logger.debug "ApplicationController::activ_link"
    if params[:controller] == name && params[:action] != 'home' && params[:action] != 'about' && params[:action] != 'signup'
      return "active"
    else
      if params[:action] == name
        return "active"
      else
      return ""
      end
    end
  end
end
