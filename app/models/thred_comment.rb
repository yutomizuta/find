class ThredComment < ApplicationRecord
  belongs_to :thred

  validates :text, presence: true
end
