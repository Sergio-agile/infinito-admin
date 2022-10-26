class Question < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :title_to_display, presence: true, allow_blank: false
  validates :order, presence: true, allow_blank: false
  has_one :categories
end
