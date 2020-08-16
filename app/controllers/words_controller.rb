class WordsController < ApplicationController
  def index
    if params[:tag_name]
      @words = Word.tagged_with("#{params[:tag_name]}")
    else
      @words = Word.all
    end
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
     if @word.save
      redirect_to word_path(@word.id)
    else
      @words = word.all
      @user = User.find(current_user.id)
      render 'index'
    end
  end

  def show
    @word = Word.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @word = Word.find(params[:id])
   if  @word.user == current_user
    render 'edit'
   else 
    redirect_to word_path(current_user.id)
   end
  end
  
  def update
    @word = Word.find(params[:id])  
    if @word.update(word_params)
    redirect_to word_path(@word.id)
   else
    render 'edit'
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
      redirect_to words_path
  end

  private
  def word_params
      params.require(:word).permit(:word, :tag_list)
  end

end
