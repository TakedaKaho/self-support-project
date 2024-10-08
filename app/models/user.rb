class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :goals, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :meal_logs, dependent: :destroy
  has_many :body_logs, dependent: :destroy
  has_many :exercise_logs, dependent: :destroy
end
