class Public::ThredCommentsController < ApplicationController
  before_action :authenticate_student!

  def create
    @comment = ThredComment.new(thred_comment_params)
    @comment.student_id = current_student.id
    @comment.thred_id = params[:thred_id]
    if @comment.save
      redirect_to bbs_thred_path(@comment.thred.bbs, @comment.thred)
    else
      @thred = Thred.find(params[:thred_id])
      @comments = @thred.thred_comments
      render 'public/threds/show'
    end
  end

  def destroy
    comment = ThredComment.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def thred_comment_params
    params.require(:thred_comment).permit(:text)
  end
end
