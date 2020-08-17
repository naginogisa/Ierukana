class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
    @search = Word.ransack(params[:q])
    @search_words = @search.result
 
  end 
end
