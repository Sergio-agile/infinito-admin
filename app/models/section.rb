class Section < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :title_to_display, presence: true, allow_blank: false
  validates :order, presence: true, allow_blank: false, numericality: { only_integer: true }
  has_many :questions
  has_many :sections, dependent: :destroy
  belongs_to :section, optional: true
end
