require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        binding.pry
        expect(@user).to be_valid
      end
      
      it 'passwordとpassword_confirmationが6文字以上の半角英数字混合であれば登録できる' do
        @user.password = 'sampl1'
        @user.password_confirmation = 'sampl1'
        expect(@user).to be_valid
      end

      it 'last_name_zenkakuとfirst_name_zenkakuが記号類を除く全角文字であれば登録できる' do
        @user.last_name_zenkaku = 'さんぷる'
        @user.first_name_zenkaku = '手須斗'
        expect(@user).to be_valid
      end

      it 'l_name_zenkaku_katakanaとf_name_zenkaku_katakanaが全角カタカナであれば登録できる' do
        @user.l_name_zenkaku_katakana = 'サンプル'
        @user.f_name_zenkaku_katakana = 'テスト'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'samp1'
        @user.password_confirmation = 'samp1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが半角英文字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '生年月日が空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
      it 'last_name_zenkakuが空では登録できない' do
        @user.last_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku can't be blank")
      end
      it 'first_name_zenkakuが空では登録できない' do
        @user.first_name_zenkaku = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku can't be blank")
      end
      it 'l_name_zenkaku_katakanaが空では登録できない' do
        @user.l_name_zenkaku_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("L name zenkaku katakana can't be blank")
      end
      it 'f_name_zenkaku_katakanaが空では登録できない' do
        @user.f_name_zenkaku_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("F name zenkaku katakana can't be blank")
      end
      it 'last_name_zenkakuが半角文字では登録できない' do
        @user.last_name_zenkaku = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku is invalid")
      end
      it 'first_name_zenkakuが半角文字では登録できない' do
        @user.first_name_zenkaku = 'Tesuto'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku is invalid")
      end
      it 'l_name_zenkaku_katakanaが半角文字では登録できない' do
        @user.l_name_zenkaku_katakana = 'Yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("L name zenkaku katakana is invalid")
      end
      it 'f_name_zenkaku_katakanaが半角文字では登録できない' do
        @user.f_name_zenkaku_katakana = 'Tesuto'
        @user.valid?
        expect(@user.errors.full_messages).to include("F name zenkaku katakana is invalid")
      end
      it 'last_name_zenkakuが全角文字でも記号が含まれる場合は登録できない' do
        @user.last_name_zenkaku = '山田％'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zenkaku is invalid")
      end
      it 'first_name_zenkakuが全角文字でも記号が含まれる場合は登録できない' do
        @user.first_name_zenkaku = '手須斗！'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zenkaku is invalid")
      end
      it 'l_name_zenkaku_katakanaが全角文字でも記号が含まれる場合は登録できない' do
        @user.l_name_zenkaku_katakana = 'ヤマダ％'
        @user.valid?
        expect(@user.errors.full_messages).to include("L name zenkaku katakana is invalid")
      end
      it 'f_name_zenkaku_katakanaが全角文字でも記号が含まれる場合は登録できない' do
        @user.f_name_zenkaku_katakana = 'テスト！'
        @user.valid?
        expect(@user.errors.full_messages).to include("F name zenkaku katakana is invalid")
      end
    end
  end
end