users

|Column                       |Type   |Options         |
|-----------------------------|-------|----------------|
|nickname                     |string |null: false     |
|email                        |string |unique: true    |
|encrypted_password           |string |null: false     |
|family_name                  |string |null: false     |
|first_name                   |string |null: false     |
|family_name_kana             |string |null: false     |
|first_name_kana              |string |null: false     |
|birth_day                    |date   |null: false     |




### Association
has_many :items
has_many :purchase_records

items

|Column                          |Type     |Options                             |
|--------------------------------|---------|------------------------------------|
|item_name                       |string    |null: false                        |
|item_description                |text      |null: false                        |
|item_category                   |integer   |null: false                        |
|item_condition                  |integer   |null: false                        |
|payment_method                  |integer   |null: false                        |
|sending_area                    |integer   |null: false                        |
|delivery_time                   |integer   |null: false                        |
|item_price                      |integer   |null: false                        |
|admin_fee                       |integer   |null: false                        |
|user                            |references|null: false, foreign_key: true     |

### Association
belongs_to :user
has_one :purchase_record

purchase_records

|Column                   |Type       |Options                            |
|-------------------------|-----------|-----------------------------------|
|user                     |references |null: false, foreign_key: true     |
|item                     |references |null: false, foreign_key: true     |
|delivery_address         |references |null: false, foreign_key: true     |

### Association
belongs_to :user
belongs_to :item
has_one :delivery_address

delivery_addresses

|Column                       |Type      |Options                            |
|-----------------------------|----------|-----------------------------------|
|postal_code                  |string    |null: false                        |
|prefecture                   |integer   |null: false                        |
|city                         |string    |null: false                        |
|address                      |string    |null: false                        |
|building_name                |string    |                                   |
|phone_number                 |string    |null: false                        |
|item                         |references|null: false, foreign_key: true     |

### Association
belongs_to :purchase_record

