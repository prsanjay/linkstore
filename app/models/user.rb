class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :links, dependent: :destroy

  validates :first_name,:last_name, :email, presence: true
  validates :password,presence: true, on: :create
  validates :email, uniqueness: true, on: :create
end
