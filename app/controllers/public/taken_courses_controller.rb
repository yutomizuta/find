class Public::TakenCoursesController < ApplicationController
  def create
    @taken_course = TakenCourse.new(taken_course_params)
    @taken_course.student_id = current_student.id
    @taken_course.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    
  end

  private

  def taken_course_params 
    params.require(:taken_course).permit(:name, :day_of_week, :period)
  end
end
