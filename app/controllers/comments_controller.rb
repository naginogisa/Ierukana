class CommentsController < ApplicationController
  def create
    @word = Word.find(params[:word_id])
    @comment = current_user.comments.new(comment_params)
    @comment.word_id = @word.id
    @comment.save
    redirect_to word_path(@word.id)
  end
  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])  
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
