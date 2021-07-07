# Holds information relative to how long a slide was active during a certain presentation
class SlidePresentation < ApplicationRecord
  belongs_to :slide
  belongs_to :presentation

  validates :start_time, numericality: { less_than: :end_time }

  def total_time
    end_time - start_time
  end
end
