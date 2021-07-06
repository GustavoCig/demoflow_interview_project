class Slide < ApplicationRecord
  belongs_to :demo

  has_many :slide_presentations
  has_many :presentations, through: :slide_presentations
end
