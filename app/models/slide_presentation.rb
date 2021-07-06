class SlidePresentation < ApplicationRecord
  belongs_to :slide
  belongs_to :presentation
end
