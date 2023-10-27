class Approval < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pros_and_cons
  belongs_to :user
  belongs_to :event
  validates :pros_and_cons_id, numericality: { other_than: 1 , message: "を選択して下さい"}
end
