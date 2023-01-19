require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「--」以外であれば登録できる' do
        @item.item_category_id = 1
        expect(@item).to be_valid
      end
      it '商品の状態が「--」以外であれば登録できる' do
        @item.item_condition_id = 1
        expect(@item).to be_valid
      end
      it '配送料の負担が「--」以外であれば登録できる' do
        @item.payment_method_id = 1
        expect(@item).to be_valid
      end
      it '発送元の地域が「--」以外であれば登録できる' do
        @item.prefecture_id = 1
        expect(@item).to be_valid
      end
      it '発送までの日数が「--」以外であれば登録できる' do
        @item.delivery_time_id = 1
        expect(@item).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @item.item_price = 500
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist', "User can't be blank")
      end
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'カテゴリーの情報が「--」だと出品できない' do
        @item.item_category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank or --")
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank or --")
      end
      it '商品の状態の情報が「--」だと出品できない' do
        @item.item_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank or --")
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank or --")
      end
      it '配送料の負担の情報が「--」だと出品できない' do
        @item.payment_method_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment method can't be blank or --")
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @item.payment_method_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment method can't be blank or --")
      end
      it '発送元の地域の情報が「--」だと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank or --")
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank or --")
      end
      it '発送までの日数の情報が「--」だと出品できない' do
        @item.delivery_time_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank or --")
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @item.delivery_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank or --")
      end
      it '価格が空欄だと出品できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank", "Item price is not a number")
      end
      it '・価格に半角数字以外が含まれている場合は出品できない' do
        @item.item_price = "９99"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
    end
  end
end