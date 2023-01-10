users

|Column                       |Type   |Options         |
|-----------------------------|-------|----------------|
|nickname                     |string |null: false     |
|email                        |string |unique: true    |
|password                     |string |null: false     |
|password_confirmation        |string |null: false     |
|family_name                  |string |null: false     |
|first_name                   |string |null: false     |
|family_name_kana             |string |null: false     |
|first_name_kana              |string |null: false     |
|birth_day_yy                 |integer|null: false     |
|birth_day_mm                 |integer|null: false     |
|birth_day_dd                 |integer|null: false     |



### Association
has_many :items
has_many :purchase_records

items

|Column                       |Type     |Options                            |
|-----------------------------|---------|-----------------------------------|
|item_image                   |string   |null: false                        |
|item_name                    |string   |null: false                        |
|item_description             |string   |null: false                        |
|item_category                |string   |null: false                        |
|item_condition               |string   |null: false                        |
|payment_method               |string   |null: false                        |
|sending_area                 |string   |null: false                        |
|delivery_time                |string   |null: false                        |
|item_price                   |integer  |null: false                        |
|admin_fee                    |integer  |null: false                        |
|sales_profit                 |integer  |null: false                        |
|user_id                      |reference|null: false, foreign_key: true     |

### Association
belongs_to :user
has_one :purchase_record

purchase_records

|Column                   |Type      |Options                            |
|-------------------------|----------|-----------------------------------|
|user_id                  |reference |null: false, foreign_key: true     |
|item_id                  |reference |null: false, foreign_key: true     |
|delivery_address         |reference |null: false, foreign_key: true     |

### Association
belongs_to :user
has_one :delivery_address

delivery_address

|Column                       |Type      |Options                            |
|-----------------------------|----------|-----------------------------------|
|postal_code                  |string    |null: false                        |
|prefectures                  |string    |null: false                        |
|city                         |string    |null: false                        |
|address                      |string    |null: false                        |
|building_name                |string    |null: false                        |
|phone_number                 |string    |null: false                        |
|user_id                      |reference |null: false, foreign_key: true     |

### Association
has_one :purchase_record

