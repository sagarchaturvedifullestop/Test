class InfoController < ApplicationController
  def signup
  end
  
  def about
  end

  def give_back
  end
  def login
  end

  def opensource
    
  end
  def home
    auth = request.env["omniauth.auth"]
      #raise auth.to_yaml
  end

end
