require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録できるとき' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに一意性がないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@がなければ登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは6文字以上じゃないと登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password is too short (minimum is 6 characters)', 'Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数字混合がないと登録できない（英字）' do
        @user.password = 'abcdfg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英数字混合がないと登録できない（数字）' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", 'Password is invalid')
      end
      it 'passwordとpasswrod(確認)は一致していることが必須である' do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空だと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_name_kanaが空だと登録できない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'family_name_kanaは半角だと登録できない' do
        @user.family_name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaは半角だと登録できない' do
        @user.first_name_kana = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'birth_dateが空だと登録できない' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end

    context '新規登録できるとき'
    it 'すべての項目が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'ニックネームが空でなければ登録できる' do
      @user.nickname = FactoryBot.build(:user, nickname: @user.nickname)
      expect(@user).to be_valid
    end
    it 'メールアドレスが空でなければ登録できる' do
      @user.email = 'email@com'
      expect(@user).to be_valid
    end
    it 'メールアドレスに一意性があれば登録できる' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      expect(@user).to be_valid
    end
    it 'メールアドレスに@があれば登録できる' do
      @user.email = 'email@com'
      expect(@user).to be_valid
    end
    it 'パスワードが空でなければ登録できる' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end
    it 'パスワードが6文字以上であれば登録できる' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end
    it 'パスワードは半角英数字混合であれば登録できる' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end
    it 'パスワードとパスワード（確認）が一致していれば登録できる' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end
    it 'family_nameが空でなければ登録できる' do
      @user.family_name = '名字'
      expect(@user).to be_valid
    end
    it 'first_nameが空でなければ登録できる' do
      @user.first_name = '名前'
      expect(@user).to be_valid
    end
    it 'family_name_kanaが空でなければ登録できる' do
      @user.family_name_kana = 'ミョウジ'
      expect(@user).to be_valid
    end
    it 'first_name_kanaが空でなければ登録できる' do
      @user.first_name_kana = 'ナマエ'
      expect(@user).to be_valid
    end
    it 'family_name_kanaが全角だと登録できる' do
      @user.family_name_kana = 'ミョウジ'
      expect(@user).to be_valid
    end
    it 'first_name_kanaが全角だと登録できる' do
      @user.first_name_kana = 'ナマエ'
      expect(@user).to be_valid
    end
    it 'birth_dateが空でなければ登録できる' do
      @user.birth_date = '2000-01-01'
      expect(@user).to be_valid
    end
  end
end
