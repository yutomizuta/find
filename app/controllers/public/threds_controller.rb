class Public::ThredsController < ApplicationController
  before_action :authenticate_student!

  def show
    @comment = ThredComment.new
    @thred = Thred.find(params[:id])
    @comments = @thred.thred_comments
  end

  def create
    bbs = Bbs.find(params[:bbs_id])
    @thred = Thred.new(thred_params)
    @thred.student_id = current_student.id
    @thred.bbs_id = bbs.id
    if @thred.save
      redirect_back(fallback_location: root_path)
    else
      @bbs = Bbs.find(params[:bbs_id])
      @threds = @bbs.threds
      render 'public/bbses/show'
    end
  end

  def destroy
    thred = Thred.find_by(id: params[:id], bbs_id: params[:bbs_id])
    thred.destroy
    redirect_back(fallback_location: root_path)
  end
  

  private

  def thred_params
    params.require(:thred).permit(:text)
  end
end
