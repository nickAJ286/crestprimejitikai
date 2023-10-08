class type < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '役員' },
  ]

  include ActiveHash::Associations
  has_many :roles

  end