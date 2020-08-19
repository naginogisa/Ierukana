class CommentsController < ApplicationController
  def create
    @word = Word.find(params[:word_id])
    @comment = current_user.comments.new(comment_params)
    @comment.word_id = @word.id
    @comment.save
    redirect_to word_path(@word.id)
  end
  def edit
    @comment = Comment.find_by(word_id: params[:word_id], id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id], word_id: params[:word_id])
    @comment.update(comment_params)
    redirect_to word_path(@comment.word.id)
  end

  def destroy
    Comment.find_by(id: params[:id], word_id: params[:word_id]).destroy
    redirect_to word_path(params[:word_id])  
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :rate)
  end
end
