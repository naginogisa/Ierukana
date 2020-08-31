require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    it "名前、メール、パスワードがある場合、有効である" do
      user = User.new(
      name: "test",
      email: "test@example.com",
      password: "password",
      )
      expect(user).to be_valid
    end

    it "名がない場合、無効である" do
      user = User.new(
      name: nil,
      email: "test@example.com",
      password: "password",
      )
      user.valid?
      expect(user.errors[:name])
    end
  end


  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Word.reflect_on_association(:user).macro).to eq :belongs_to
      end
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end