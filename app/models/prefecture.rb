class Prefecture < ActiveHash::Base
  self.data = [
    { id: 0, item_name: '---' }, { id: 1, item_name: '北海道' }, { id: 2, item_name: '青森県' },
    { id: 3, item_name: '岩手県' }, { id: 4, item_name: '宮城県' }, { id: 5, item_name: '秋田県' },
    { id: 6, item_name: '山形県' }, { id: 7, item_name: '福島県' }, { id: 8, item_name: '茨城県' },
    { id: 9, item_name: '栃木県' }, { id: 10, item_name: '群馬県' }, { id: 11, item_name: '埼玉県' },
    { id: 12, item_name: '千葉県' }, { id: 13, item_name: '東京都' }, { id: 14, item_name: '神奈川県' },
    { id: 15, item_name: '新潟県' }, { id: 16, item_name: '富山県' }, { id: 17, item_name: '石川県' },
    { id: 18, item_name: '福井県' }, { id: 19, item_name: '山梨県' }, { id: 20, item_name: '長野県' },
    { id: 21, item_name: '岐阜県' }, { id: 22, item_name: '静岡県' }, { id: 23, item_name: '愛知県' },
    { id: 24, item_name: '三重県' }, { id: 25, item_name: '滋賀県' }, { id: 26, item_name: '京都府' },
    { id: 27, item_name: '大阪府' }, { id: 28, item_name: '兵庫県' }, { id: 29, item_name: '奈良県' },
    { id: 30, item_name: '和歌山県' }, { id: 31, item_name: '鳥取県' }, { id: 32, item_name: '島根県' },
    { id: 33, item_name: '岡山県' }, { id: 34, item_name: '広島県' }, { id: 35, item_name: '山口県' },
    { id: 36, item_name: '徳島県' }, { id: 37, item_name: '香川県' }, { id: 38, item_name: '愛媛県' },
    { id: 39, item_name: '高知県' }, { id: 40, item_name: '福岡県' }, { id: 41, item_name: '佐賀県' },
    { id: 42, item_name: '長崎県' }, { id: 43, item_name: '熊本県' }, { id: 44, item_name: '大分県' },
    { id: 45, item_name: '宮崎県' }, { id: 46, item_name: '鹿児島県' }, { id: 47, item_name: '沖縄県' }
  ]

  include ActiveHash::Associations
  has_many :items
  has_many :purchase_records
end