class SessionsController < ApplicationController
  
 #load_and_authorize_resource
 
  def create

    # raise request.env["omniauth.auth"].to_yaml
     auth = request.env["omniauth.auth"]
    
     if auth

              case auth["provider"]

                when GlobalConstants::PROVIDER_TYPE[1]

                  session[:auth] = auth
                  redirect_to twitter_login_path

                when GlobalConstants::PROVIDER_TYPE[2]

                  user = find_user_from_omniauth(auth)
                  if user.nil?
                      user = User.create_from_omniauth(auth)
                  else
                      session[:user_id] = user.id
                      user = User.update_from_omniauth(user,auth)
                      redirect_to_target_or_default root_url ,:notice => "Signed in!"

  
                  end
               

                when GlobalConstants::PROVIDER_TYPE[3]
                  
                  user = find_user_from_omniauth(auth)
                  if user.nil?
                      user = User.create_from_omniauth(auth)

                  end
                  session[:user_id] = user.id
                  redirect_to_target_or_default root_url ,:notice => "Signed in!"

                else
                  redirect_to root_url
              end


    end




    
#     # puts "%"*60
#      #puts auth.to_yaml
#  if auth.provider != "twitter"
#    user = find_user_from_omniauth(auth)
#   # if !user.nil? && user.provider != auth["provider"]
#     # redirect_to root_url, :alert => "You have already registered using #{user.provider.titleize}. Please login using the same."
#     # return
#    #end
#
#    if user.nil?
#        user = User.create_from_omniauth(auth)
#
#    end
#    session[:user_id] = user.id
#    redirect_to_target_or_default(root_url)
#    #redirect_to root_url, :notice => "Signed in!"
#  else
#
#     session[:auth] = auth
#     redirect_to twitter_login_path
#
#  end
  end

  def twitter_login

    if session[:auth] then
      user = User.find_by_uid(session[:auth]["extra"][:access_token].params["user_id"])
        if !user.nil? && session[:auth]
             session[:user_id] = user.id
             redirect_to_target_or_default root_url ,:notice => "Signed in!"
        end
    else
      redirect_to root_url
      return
       
    end
  end

  def twitter_login_check

    if !session[:auth] then
      redirect_to root_url
      return
    end
    auth = session[:auth]
    session[:auth] = nil
    auth["info"]["email"] = params[:email]
    user = find_user_from_omniauth(auth)
    
    if user.nil?
        user = User.create_from_omniauth(auth)
        session[:user_id] = user.id
        redirect_to_target_or_default root_url ,:notice => "Signed in!"
    else
        session[:user_id] = user.id
        user = User.update_from_omniauth(user,auth)
        redirect_to_target_or_default root_url ,:notice => "Signed in!"
    end
   
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end


  def failure

#    if session[:fb_token]
#
#     split_token = session[:fb_token].split("|")
#    fb_api_key = split_token[1]
#    fb_session_key = split_token[0]
#    session[:fb_token] = nil
#    session[:user_id] = nil
#    reset_session
#    session[:messagesuccess] = "Sorry, but you didn't allow access to our app!"
#    redirect_to "https://www.facebook.com/logout.php?access_token=#{fb_session_key}&confirm=1&next=#{root_url}login";
#
#    else
#
#    session[:fb_token] = nil
#    session[:user_id] = nil
#    reset_session
#    session[:messageerror] = "Sorry, but you didn't allow access to our app!"
#    redirect_to login_url
#    end
redirect_to root_url, :notice => "Sorry, you didn't allowed access to our app!"
  end
  
  private
  
  def find_user_from_omniauth(auth)
    user = nil
     user = User.find_by_email(auth["info"]["email"])
    # If its twitter, there's no email field from the auth hash
    #if auth.provider == "twitter"
    #  user = User.find_by_nickname(auth["info"]["nickname"])
   # else
     # user = User.find_by_email(auth["info"]["email"])
    #end
    user
  end
  
end
