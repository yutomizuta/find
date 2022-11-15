class Thred < ApplicationRecord
  belongs_to :bbs
  has_many :thred_comments, dependent: :destroy

  validates :text, presence: true
end
