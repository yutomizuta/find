class Public::RelationshipsController < ApplicationController
  before_action :authenticate_student!
  def create
    student = Student.find(params[:student_id])
    current_student.follow(student)
		redirect_to request.referer
  end

  def destroy
    student = Student.find(params[:student_id])
    current_student.unfollow(student)
		redirect_to request.referer
  end

  def followings
    student = Student.find(params[:student_id])
		@students = student.followings
  end

  def followers
    student = Student.find(params[:student_id])
		@students = student.followers
  end
end
