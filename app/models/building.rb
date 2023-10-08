class Building < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '壱番街' },
    { id: 3, name: '弐番街' },
    { id: 4, name: '参番街' },
    { id: 5, name: '七番街' },
  ]

  include ActiveHash::Associations
  has_many :users

  end