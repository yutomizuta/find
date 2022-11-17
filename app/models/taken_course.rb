class TakenCourse < ApplicationRecord
  validates :name,        presence: true
  validates :day_of_week, presence: true
  validates :period,      presence: true

  enum day_of_week: { 月曜日: 0, 火曜日: 1, 水曜日: 2, 木曜日: 3, 金曜日: 4, 土曜日: 5, オンライン: 6 }
  enum period:      { １限: 0, ２限: 1, ３限: 2, ４限: 3, ５限: 4, 指定なし: 5 }

  belongs_to :student

  # 曜日と時間で時間割に埋め込み
  def self.schedule(student, day_of_week, priod)
    find_by(student_id: student, day_of_week: day_of_week, period: priod)&.name
  end
  
end
