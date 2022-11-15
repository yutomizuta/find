class Public::SearchesController < ApplicationController
  before_action :authenticate_student!

  def search
    word = params[:word]
    @bbses = Bbs.where("university_name LIKE?","%#{word}%")
    @bbs = Bbs.new
  end
end
