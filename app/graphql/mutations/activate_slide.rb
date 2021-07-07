module Mutations
  class ActivateSlide < BaseMutation
    field :slide, Types::SlideType, null: false

    argument :slide_id, ID, required: true

    def resolve(slide_id:)
      slide = Slide.find(slide_id)
      slide.toggle_active!

      {
        slide: slide
      }
    end
  end
end
