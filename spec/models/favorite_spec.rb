require 'rails_helper'

RSpec.describe Favorite, type: :model do
    describe 'アソシエーションのテスト' do
    context 'Favoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(Favorite.reflect_on_association(:user).macro).to eq :belongs_to
      end
      it '1:Nとなっている' do
        expect(Favorite.reflect_on_association(:word).macro).to eq :belongs_to
      end
    end
  end
end