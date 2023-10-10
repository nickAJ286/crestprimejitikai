class Building < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '壱番街' },
    { id: 2, name: '弐番街' },
    { id: 3, name: '参番街' },
    { id: 7, name: '七番街' },
  ]

  include ActiveHash::Associations
  has_many :users

  end