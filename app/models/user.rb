class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:linkedin, :facebook, :gplus, :twitter, :tumblr],
         :authentication_keys => [:email]
  has_many :posts
  has_many :comments
  validate :columns_present
  validate :anonymous
  validate :namecombo

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.image = auth.info.image
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  def namecombo
    if (self.name === nil)
      self.name = self.first_name + " " + self.last_name;
    end
  end

  def columns_present
    if (self.first_name === "")
      self.errors.add(:base, 'First Name can\'t be blank')
    end
    if (self.last_name === "")
      self.errors.add(:base, 'Last Name can\'t be blank')
    end
  end
  def anonymous
    if (self.image === "")
      self.image = "http://www.caribbeanmemoryproject.com/uploads/3/9/6/8/39688192/815731.jpg";
    end
  end
end
