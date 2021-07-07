module Slides
  class Activate < BaseOperation
    def initialize(slide_id)
      @slide = Slide.find(slide_id)
    end

    def call!
      Slide.transaction do
        @slide.activate!
        fetch_other_active_slides.each(&:deactivate!)
      end

      @slide
    end

    def fetch_other_active_slides
      @slide.demo
            .slides
            .active
            .where.not(id: @slide.id)
    end
  end
end
