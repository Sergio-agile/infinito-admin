class Patient < ApplicationRecord
  has_many :consultations, dependent: :destroy
end
