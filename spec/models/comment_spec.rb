require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user)
      word = FactoryBot.create(:word)
    end

    context 'commentカラム' do
      it '空欄でないこと' do
        comment = @user.comments.new(
          comment: nil,
          rate: 4.5,
          word_id: 1,
          user_id: 1
        )    
        expect(comment.valid?).to eq false;
      end
      it 'commentがある場合、有効である' do
        comment = @user.comments.new(
          comment: "最高ですね",
          rate: 4.5,
          word_id: 1,
          user_id: 1
        )    
        expect(comment.valid?).to eq true;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Commentモデルとの関係' do
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:word).macro).to eq :belongs_to
      end
    end
  end
end