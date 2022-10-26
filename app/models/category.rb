class Category < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :title_to_display, presence: true, allow_blank: false
  validates :order, presence: true, allow_blank: false, numericality: { only_integer: true }
  # belongs_to :question
end