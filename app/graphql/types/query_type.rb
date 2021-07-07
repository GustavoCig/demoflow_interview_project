module Types
  class QueryType < Types::BaseObject
    field :demos,
          [Types::DemoType],
          null: false,
          description: 'Fetches a list of created demos with it\'s respective slides'

    field :presentation, Types::PresentationType, null: false do
      description 'Fetches a presentation with the amount spent in each slide'
      argument :presentation_id, ID, required: true
    end

    def demos
      Demo.includes(:slides, :presentations).all
    end

    def presentation(presentation_id:)
      Presentation.find(presentation_id)
    end
  end
end
