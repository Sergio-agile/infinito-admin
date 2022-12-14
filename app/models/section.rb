class Section < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :title_to_display, presence: true, allow_blank: false
  validates :order, presence: true, allow_blank: false, numericality: { only_integer: true }
  has_many :questions, -> { order(order: :asc) }
  has_many :sections, -> { order(order: :asc) }, dependent: :destroy
  belongs_to :section, optional: true
end
