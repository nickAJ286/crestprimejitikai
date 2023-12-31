class Event < ApplicationRecord
  belongs_to :user
  has_many :approvals
  has_many :organizers
  has_many :participations
  has_many :pre_comments
  has_many :before_comments
  has_many :after_comments
  has_one_attached :image

  validates :name, presence: true
  validates :catch_copy, presence: true
  validates :event_date, presence: true
  validates :event_time, presence: true

end
