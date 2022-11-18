class Public::BbsesController < ApplicationController
  before_action :authenticate_student!

  def index
    @bbs = Bbs.new
    @bbses = Bbs.all.page(params[:page]).per(6)
  end

  def show
    @bbs = Bbs.find(params[:id])
    @thred = Thred.new
    @threds = @bbs.threds.order(id: "DESC").page(params[:page]).per(4)
  end

  def create
    @bbs = Bbs.new(bbs_params)
    if @bbs.save
      redirect_back(fallback_location: root_path)
    else
      @bbses = Bbs.all.page(params[:page]).per(6)
      render 'index'
    end
  end

  private

  def bbs_params
    params.require(:bbs).permit(:university_name)
  end
end
