module Types
  class DemoType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :slides, [Types::SlideType], null: false
    field :presentations, [Types::PresentationType], null: false
  end
end
