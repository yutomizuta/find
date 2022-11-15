class Room < ApplicationRecord
  has_many :chats
  has_many :student_rooms
end
