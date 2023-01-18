class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one    :purchase_record

  belongs_to :item_category
  belongs_to :prefecture
  belongs_to :item_condition
  belongs_to :payment_method
  belongs_to :delivery_time

  has_one_attached :image

  with_options presence: true do
    validates :user_id
    validates :image
    validates :item_name
    validates :item_description
    validates :item_category_id
    validates :item_condition_id
    validates :payment_method_id
    validates :prefecture_id
    validates :delivery_time_id
    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :item_category_id
      validates :prefecture_id
      validates :item_condition_id
      validates :payment_method_id
      validates :delivery_time_id
    end
end
