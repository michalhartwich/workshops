class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, :lastname, presence: true

  has_many :reviews, dependent: :destroy
  has_many :products, dependent: :destroy

  def fullname
    "#{firstname} #{lastname}"
  end
end
