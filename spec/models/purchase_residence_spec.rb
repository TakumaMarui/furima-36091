require 'rails_helper'

RSpec.describe PurchaseResidence, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_residence = FactoryBot.build(:purchase_residence, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end
    context "商品が購入できるとき" do
      it "全ての値が正しく入力されていると保存できること" do
        expect(@purchase_residence).to be_valid
      end
      it "building_nameが空でも保存できること" do
        @purchase_residence.building_name = ""
        expect(@purchase_residence).to be_valid
      end
    end
    context "商品が購入できないとき" do
      it "postal_codeが空だと保存できないこと" do
        @purchase_residence.postal_code = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeは半角数値のみでは保存できないこと" do
        @purchase_residence.postal_code = "1234567"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeは半角英数字混合では保存できないこと" do
        @purchase_residence.postal_code = "123-456a"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Postal code is invalid")
      end
      it "prefecture_idが1だと保存できないこと" do
        @purchase_residence.prefecture_id = 1
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空だと保存できないこと" do
        @purchase_residence.city = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空だと保存できないこと" do
        @purchase_residence.house_number = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空だと保存できないこと" do
        @purchase_residence.phone_number = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが9桁以下だと保存できないこと" do
        @purchase_residence.phone_number = "123456789"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが12桁以上だと保存できないこと" do
        @purchase_residence.phone_number = "123456789012"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが半角英数字混合だと保存できないこと" do
        @purchase_residence.phone_number = "123456789ab"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが半角数字とハイフンの混合だと保存できないこと" do
        @purchase_residence.phone_number = "123-4567-8901"
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空だと保存できないこと" do
        @purchase_residence.token = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空だと保存できないこと" do
        @purchase_residence.user_id = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと保存できないこと" do
        @purchase_residence.item_id = ""
        @purchase_residence.valid?
        expect(@purchase_residence.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
