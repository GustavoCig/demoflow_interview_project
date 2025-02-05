# Holds information relative to how long a slide was active during a certain presentation
class SlidePresentation < ApplicationRecord
  belongs_to :slide
  belongs_to :presentation

  # Should extract to validator
  validate :start_time_less_than_end_time

  def total_time
    end_time - start_time
  end

  private

  def start_time_less_than_end_time
    return if start_time.nil? || end_time.nil? || start_time < end_time

    errors.add(:base, 'start_time should be lower than end_time')
  end
end
