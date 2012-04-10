class User < ActiveRecord::Base
#  attr_accessible :name, :email, :site_url, :email_on_reply
  before_create { generate_token(:token) }
  has_many :comments
  has_paper_trail

  def self.create_from_omniauth(omniauth)


    case omniauth["provider"]

                when GlobalConstants::PROVIDER_TYPE[1]

                   user_id = omniauth["extra"][:access_token].params["user_id"]

                when GlobalConstants::PROVIDER_TYPE[2]

                   user_id = omniauth["uid"]

                when GlobalConstants::PROVIDER_TYPE[3]

                   user_id = omniauth["uid"]

                else

        end

   User.new.tap do |user|
      user.name = omniauth["info"]["name"]
      user.email = omniauth["info"]["email"]
      user.provider = omniauth["provider"]
      user.nickname = omniauth["info"]["nickname"]
      user.uid = user_id
      user.omniauth_hash = omniauth.to_yaml
      user.save!

    end
  end

  def self.update_from_omniauth(user_detail,omniauth)

    case omniauth["provider"]

                when GlobalConstants::PROVIDER_TYPE[1]

                   user_id = omniauth["extra"][:access_token].params["user_id"]

                when GlobalConstants::PROVIDER_TYPE[2]

                   user_id = omniauth["uid"]

                when GlobalConstants::PROVIDER_TYPE[3]

                   user_id = omniauth["uid"]

                else

        end


    @user_details = User.find_by_id(user_detail.id)
    @user_details.name = omniauth["info"]["name"]
      @user_details.email = omniauth["info"]["email"]
      @user_details.provider = omniauth["provider"]
      @user_details.nickname = omniauth["info"]["nickname"]
      @user_details.uid = user_id
      @user_details.omniauth_hash = omniauth.to_yaml
      @user_details.save!

   
    
  end


  def generated_unsubscribe_token
    if unsubscribe_token.blank?
      generate_token(:unsubscribe_token)
      save!
    end
    unsubscribe_token
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def display_name
    name.present? ? name : github_username
  end

  def banned?
    banned_at
  end
end
