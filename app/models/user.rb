require 'digest/sha2'

class User < ActiveRecord::Base
  attr_accessible :name,:password,:password_confirmation
  validates :name, presence:true, uniqueness:true
  validates :password, confirmation:true
  attr_accessor :password_confirmation
  attr_reader :password
  validate :password_must_be_present

  def User.authenticate(name,password)
  	if user = find_by_name(name)
  	  if user.hash_password == encrypt_password(password,user.salt)
  	  	user
  	  end
  	end
  end

  def User.encrypt_password(password,salt)
  	Digest::SHA2.hexdigest(password+"wibble"+salt)
  end

  #password is a virtual attribute
  def password=(password)
  	@password = password
  	if password.present?
  	  genaerate_salt
  	  self.hash_password = self.class.encrypt_password(password,salt)
  	end
  end

  

  private
  def password_must_be_present
  	errors.add(:password,"Missing password") unless hash_password.present?
  end

  def genaerate_salt
  	self.salt = self.object_id.to_s + rand.to_s
  end
end
