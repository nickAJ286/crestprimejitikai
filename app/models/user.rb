class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :building
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :building_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
