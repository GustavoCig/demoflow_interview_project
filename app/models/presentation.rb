class Presentation < ApplicationRecord
  belongs_to :demo

  validates :start_time, numericality: { less_than: :end_time }

  def total_time
    end_time - start_time
  end
end
