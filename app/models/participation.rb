class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :name, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :choice
end
