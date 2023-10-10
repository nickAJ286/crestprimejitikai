class Approval < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pros_and_cons
  belongs_to :user
  belongs_to :event
end
