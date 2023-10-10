class ProsAndCons < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '賛成' },
    { id: 3, name: '反対' },
    { id: 4, name: '条件付き賛成' },
  ]

  include ActiveHash::Associations
  has_many :approvals
end