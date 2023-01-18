class ItemCondition < ActiveHash::Base
  self.data = [
    { id: 0, item_name: '--' },
    { id: 1, item_name: '新品、未使用' },
    { id: 2, item_name: '未使用品に近い' },
    { id: 3, item_name: '目立った傷や汚れなし' },
    { id: 4, item_name: 'やや傷や汚れあり' },
    { id: 5, itme_name: '傷や汚れあり' },
    { id: 6, item_name: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :items
end