class FavoritesController < ApplicationController
  before_action :set_word

  def create
    @favorite = current_user.favorites.new(word_id: @word.id)
    @favorite.save
  end

  def destroy
    @favorite = current_user.favorites.find_by(word_id: @word.id)
    @favorite.destroy
  end

  def set_word
    @word = Word.find(params[:word_id])
  end
end
