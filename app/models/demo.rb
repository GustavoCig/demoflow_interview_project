class Demo < ApplicationRecord
  has_many :slides
  has_many :presentations

  def start!
    presentations.create(start_time: Time.current)
  end

  def end!
    presentations.where(end_time: nil)
                 .first
                 .update(end_time: Time.current)
  end
end
