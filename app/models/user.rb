class User < ApplicationRecord

  has_many :pics

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin
    self.email == "lusersks@gmail.com"
  end

end
