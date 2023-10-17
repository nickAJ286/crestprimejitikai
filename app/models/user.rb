class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :building
  belongs_to :role
  has_many :approvals
  has_many :pre_comments
  has_many :before_comments
  has_many :after_comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :building_id, numericality: { other_than: 0 , message: "can't be blank"} 
end
