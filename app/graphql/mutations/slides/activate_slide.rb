module Mutations
  module Slides
    class ActivateSlide < BaseMutation
      field :slide, Types::SlideType, null: false

      argument :slide_id, ID, required: true

      def resolve(slide_id:)
        slide = Slide.find(slide_id)
        slide.activate!

        {
          slide: slide
        }
      end
    end
  end
end
