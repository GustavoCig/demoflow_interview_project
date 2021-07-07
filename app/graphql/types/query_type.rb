module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :demos,
          [Types::DemoType],
          null: false,
          description: 'Fetches a list of created demos with it\'s respective slides'

    field :presentation,
          Types::PresentationType,
          null: false,
          description: 'Fetches a presentation with the ammount spent in each slide'

    # argument :presentation_id,
    #          Integer,
    #          required: true

    def demos
      Demo.includes(:slides).all
    end

    # def presentation(presentation_id:)
    #   Presentation.find(presentation_id)
    # end
  end
end
