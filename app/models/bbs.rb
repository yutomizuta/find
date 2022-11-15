class Bbs < ApplicationRecord
  has_many :threds, dependent: :destroy

  validates :university_name, presence: true, uniqueness: true
end
