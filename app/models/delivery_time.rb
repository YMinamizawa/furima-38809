class DeliveryTime < ActiveHash::Base
  self.data = [
    { id: 0, item_name: '--' },
    { id: 1, item_name: '1~2日で発送' },
    { id: 2, item_name: '2~3日で発送' },
    { id: 3, item_name: '4~7日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end