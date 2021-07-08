require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "ニックネームが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it "メールアドレスは、@を含む必要があること" do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = '1a'
      @user.password_confirmation = '1a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角数字のみだと登録できないこと" do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードは、半角英字のみだと登録できないこと" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "パスワードとパスワード（確認）は、値の一致が必須であること" do
      @user.password = '12345a'
      @user.password_confirmation = '12345ab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "お名前(全角)の名字が必須であること" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "お名前(全角)の名前が必須であること" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "お名前(全角)の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.family_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "お名前(全角)の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "お名前カナ(全角)は、名字が必須であること" do
      @user.family_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading can't be blank")
    end
    it "お名前カナ(全角)は、名字が必須であること" do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end
    it "お名前カナ(全角)の名字は、全角（カタカナ）での入力が必須であること" do
      @user.family_name_reading = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading is invalid")
    end
    it "お名前カナ(全角)の名前は、全角（カタカナ）での入力が必須であること" do
      @user.first_name_reading = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading is invalid")
    end
    it "お名前カナ(全角)の名字は、半角（カタカナ）だと登録できないこと" do
      @user.family_name_reading = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name reading is invalid")
    end
    it "お名前カナ(全角)の名前は、半角（カタカナ）だと登録できないこと" do
      @user.first_name_reading = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading is invalid")
    end
    it "生年月日が必須であること" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
