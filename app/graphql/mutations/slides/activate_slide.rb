module Mutations
  module Slides
    class ActivateSlide < BaseMutation
      field :slide, Types::SlideType, null: false

      argument :slide_id, ID, required: true

      def resolve(slide_id:)
        {
          slide: ::Slides::Activate.new(slide_id).call!
        }
      end
    end
  end
end
