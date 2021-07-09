require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    it "image, name, description, category_id, condition_id, shipping_cost_id, prefecture_id, shipping_days_id, priceが存在していれば保存されること" do
      expect(@item).to be_valid
    end
    it "imageが空では保存できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空では保存できないこと" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "descriptionが空では保存できないこと" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "category_idが1では保存できないこと" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "condition_idが1では保存できないこと" do
      @item.condition_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "shipping_cost_idが1では保存できないこと" do
      @item.shipping_cost_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 1")
    end
    it "prefecture_idが1では保存できないこと" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "shipping_days_idが1では保存できないこと" do
      @item.shipping_days_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
    end
    it "priceが空では保存できないこと" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが299以下では保存できないこと" do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it "priceが10,000,000以上では保存できないこと" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it "priceが全角数字では保存できないこと" do
      @item.price = "３００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが半角英数字混合では保存できないこと" do
      @item.price = "300a"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceが半角英語だけでは保存できないこと" do
      @item.price = "aaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end