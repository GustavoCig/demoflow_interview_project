class Slide < ApplicationRecord
  # In a application where the different types of slides actually carry different behaviours,
  # a better approach would probably be to set a polymorphic association/heritage
  # between slides and a class for each type.
  TYPES = %i[web html image].freeze

  belongs_to :demo

  has_many :slide_presentations
  has_many :presentations, through: :slide_presentations

  validates :type, inclusion: { in: TYPES }

  before_save :only_one_active_per_demo!

  scope :active, -> { where(active: true) }

  def toggle_active!
    update(active: !active)
  end

  def only_one_active_per_demo!
    return unless active

    other_active_slides = demo.slides
                              .active
                              .where
                              .not(id: id)

    other_active_slides.each(&:toggle_active!)
  end
end
