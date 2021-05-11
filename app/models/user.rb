class User < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :read_progresses, dependent: :destroy

  has_many :liked_movies, through: :likes, source: :movie
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
