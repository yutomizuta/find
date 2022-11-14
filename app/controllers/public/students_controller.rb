class Public::StudentsController < ApplicationController
  before_action :authenticate_student!
  before_action :ensure_correct_student, only: [:edit, :update]
  
  def show
    @student = Student.find(params[:id])
    @taken_course = TakenCourse.new
  end

  def edit
  end

  def update
  end

  private

  def ensure_correct_student
    @student = Student.find(params[:id])
    unless @student == current_student
      redirect_to student_path(current_student)
    end
  end
end
