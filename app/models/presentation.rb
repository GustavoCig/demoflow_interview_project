class Presentation < ApplicationRecord
  belongs_to :demo

  # Should be extracted to a validator
  validate :start_time_less_than_end_time
  validate :pending_presentation_for_demo, on: :create

  def total_time
    end_time - start_time
  end

  private

  def start_time_less_than_end_time
    return if start_time.nil? || end_time.nil? || start_time < end_time

    errors.add(:base, 'start_time should be lower than end_time')
  end

  # Assumes that a demo can't have two ongoing presentations at the same time
  def pending_presentation_for_demo
    return if demo.presentations.where(end_time: nil).none?

    errors.add(:base, 'Already exists an ongoing presentation')
  end
end
