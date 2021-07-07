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

  # This way of saving the amount of time a Slide was viewed
  # in a Presentation works if the slide is viewed only once per presentation.
  # Otherwise, will only save part of the total time.
  # A possible solution would be to pass the amount of time spent while the Slide was active,
  # Incrementing whatever time has been already saved in the SlidePresentation.
  def activate!
    Slide.transaction do
      update(active: true)
      demo.presentations
          .active
          .slide_presentations
          .create(start_time: Time.current)
    end
  end

  def deactivate!
    Slide.transaction do
      update(active: false)
      demo.presentations
          .active
          .slide_presentations
          .create(end_time: Time.current)
    end
  end
end
