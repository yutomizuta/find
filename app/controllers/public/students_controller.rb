class Public::StudentsController < ApplicationController
  before_action :authenticate_student!
  before_action :ensure_correct_student, only: [:edit, :update]
  
  def show
    @student = Student.find(params[:id])
    @taken_course = TakenCourse.new
    @taken_courses = @student.taken_courses
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  private

  def student_params
    params.require(:student).permit(:last_name, :first_name, :gender, :birthplace, :university_name, :grade, :undergraduate, :course, :profile_image)
  end

  def ensure_correct_student
    @student = Student.find(params[:id])
    unless @student == current_student
      redirect_to student_path(current_student)
    end
  end
end
