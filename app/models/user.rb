class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:linkedin, :facebook, :gplus, :twitter, :tumblr],
         :authentication_keys => [:nickname]
  validates_uniqueness_of :nickname
  has_many :posts
  has_many :comments
  validate :columns_present

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
  def columns_present
    if (self.nickname === "")
      self.errors.add(:base, 'Username can\'t be blank')
    end
    if (self.first_name === "")
      self.errors.add(:base, 'First Name can\'t be blank')
    end
    if (self.last_name === "")
      self.errors.add(:base, 'Last Name can\'t be blank')
    end
  end
end
