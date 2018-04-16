class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :omniauthable, :timeoutable, omniauth_providers: [:google_oauth2]
  def self.from_omniauth(access_token)
    data = access_token.info
    where(provider: access_token['provider'], uid: access_token['uid']).first_or_create! do |user|
      user.name = data['first_name']
      user.last_name = data['last_name']
      user.email = data['email']
      user.email_verified = true
      user.provider = access_token['provider']
      user.uid = access_token['uid']
      user.password = Devise.friendly_token[0,20]
    end
  end
end
