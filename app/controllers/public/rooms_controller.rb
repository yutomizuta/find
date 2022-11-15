class Public::RoomsController < ApplicationController
  before_action :authenticate_student!

  def index
    current_student_rooms = current_student.student_rooms
    my_room_id = []
    current_student_rooms.each do |student_room|
      my_room_id << student_room.room.id
    end
    @another_student_rooms = StudentRoom.where(room_id: my_room_id).where.not(student_id: current_student.id)
  end

  def show
    @student = Student.find(params[:id])
    rooms = current_student.student_rooms.pluck(:room_id)
    student_rooms = StudentRoom.find_by(student_id: @student.id, room_id: rooms)

    if student_rooms.nil?
      @room = Room.new
      @room.save
      StudentRoom.create(student_id: @student.id, room_id: @room.id)
      StudentRoom.create(student_id: current_student.id, room_id: @room.id)
    else
      @room = student_rooms.room
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

end
