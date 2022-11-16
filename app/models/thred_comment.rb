class ThredComment < ApplicationRecord
  belongs_to :thred
  belongs_to :student

  validates :text, presence: true
end
