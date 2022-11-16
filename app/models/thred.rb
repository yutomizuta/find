class Thred < ApplicationRecord
  belongs_to :bbs
  belongs_to :student
  has_many :thred_comments, dependent: :destroy

  validates :text, presence: true
end
