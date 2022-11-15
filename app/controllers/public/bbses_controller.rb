class Public::BbsesController < ApplicationController
  before_action :authenticate_student!

  def index
    @bbs = Bbs.new
    @bbses = Bbs.all
  end

  def show
    
  end

  def create
    @bbs = Bbs.new(bbs_params)
    if @bbs.save
      redirect_back(fallback_location: root_path)
    else
      @bbses = Bbs.all
      render 'index'
    end
  end

  private

  def bbs_params
    params.require(:bbs).permit(:university_name)
  end
end
