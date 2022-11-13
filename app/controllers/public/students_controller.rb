class Public::StudentsController < ApplicationController
  def index
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
  end

  def update
  end
end
