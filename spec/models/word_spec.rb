require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'バリデーションのテスト' do
    before do
      user = FactoryBot.create(:user)
    end

    context 'wordカラム' do
      it '空欄でないこと' do
        word = Word.new(
          word: nil,
          user_id: 1
        )    
        expect(word.valid?).to eq false;
      end
      it 'wordがある場合、有効である' do
        word = Word.new(
          word: "キツツキコツコツ枯れケヤキ",
          user_id: 1
        )    
        expect(word.valid?).to eq true;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Wordモデルとの関係' do
      it '1:Nとなっている' do
        expect(Word.reflect_on_association(:user).macro).to eq :belongs_to
      end
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:word).macro).to eq :belongs_to
      end
      it 'N:1となっている' do
        expect(Favorite.reflect_on_association(:word).macro).to eq :belongs_to
      end
    end
  end
end