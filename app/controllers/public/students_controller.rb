class Public::StudentsController < ApplicationController
  def index
  end

  def show
    @student = Student.find(params[:id])
    @taken_course = TakenCourse.new
  end

  def edit
  end

  def update
  end
end
