class Choice < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ガッツリ手伝う！' },
    { id: 3, name: '当日手伝いオッケー' },
    { id: 4, name: '当日行きます！' },
  ]

  include ActiveHash::Associations
  has_many :participation
end