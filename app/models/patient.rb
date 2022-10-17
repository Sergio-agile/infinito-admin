class Patient < ApplicationRecord
  has_many :consultations, dependent: :destroy
  validates :first_name, presence: true, allow_blank: false
  validates :last_name, presence: true, allow_blank: false
  has_one :quiz, dependent: :destroy
end
