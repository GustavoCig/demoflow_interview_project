module Types
  class QueryType < Types::BaseObject
    field :demos,
          [Types::DemoType],
          null: false,
          description: 'Fetches a list of created demos with it\'s respective slides'

    field :presentation,
          Types::PresentationType,
          null: false,
          description: 'Fetches a presentation with the amount spent in each slide'

    # argument :presentation_id,
    #          Integer,
    #          required: true

    def demos
      Demo.includes(:slides, :presentations).all
    end

    # def presentation(presentation_id:)
    #   Presentation.find(presentation_id)
    # end
  end
end
