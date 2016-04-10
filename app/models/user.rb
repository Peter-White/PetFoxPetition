class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:linkedin, :facebook, :gplus, :twitter, :tumblr],
         :authentication_keys => [:nickname]
  validate :nickname_uniqueness
  has_many :posts
  has_many :comments

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.image = auth.info.image
        user.nickname = auth.info.nickname
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end
  def nickname_uniqueness
    self.errors.add(:base, 'Username has already been taken') if User.where(:nickname => self.nickname).exists?
  end
end
