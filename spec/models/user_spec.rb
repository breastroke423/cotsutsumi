require 'rails_helper'

RSpec.describe User, type: :model do

  it "ユーザー登録できるかのテスト/validate確認" do
    @user = User.new(
      nickname: "John",
      email: "test@example.com",
      password: "i-am-john"
      )
    expect(@user).to be_valid
  end

  it "メールアドレス重複NGテスト" do
    User.create(
      nickname:  "Brawn",
      email:      "test@example.com",
      password:   "i-am-john"
      )

    @user = User.new(
      nickname:  "Smith",
      email:      "test@example.com",
      password:   "i-am-peter"
      )

    @user.valid?
    expect(@user.valid?).to eq(false)
  end

  describe 'Userバリデーションチェック' do
    it 'nicknameが空欄の場合、User作成不可' do
      @user = FactoryBot.build(:user, nickname: '')
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空欄の場合、User作成不可' do
      @user = FactoryBot.build(:user, email: '')
      expect(@user.valid?).to eq(false)
    end


  end


end
