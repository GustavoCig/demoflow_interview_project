class Slide < ApplicationRecord
  # In a application where the different types of slides actually carry different behaviours,
  # a better approach would probably be to set a polymorphic association/heritage
  # between slides and a class for each type.
  TYPES = %w[web html image].freeze

  belongs_to :demo

  has_many :slide_presentations
  has_many :presentations, through: :slide_presentations

  validates :slide_type, inclusion: { in: TYPES }

  scope :active, -> { where(active: true) }

  def activate!
    update(active: true)
  end

  def deactivate!
    update(active: false)
  end
end
