class Public::ThredCommentsController < ApplicationController
  before_action :authenticate_student!

  def create
    @comment = ThredComment.new(thred_comment_params)
    @comment.student_id = current_student.id
    @comment.thred_id = params[:thred_id]
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      @thred = Thred.find(params[:thred_id])
      @comments = @thred.thred_comments
      render 'public/threds/show'
    end
  end

  def destroy

  end

  private

  def thred_comment_params
    params.require(:thred_comment).permit(:text)
  end
end
