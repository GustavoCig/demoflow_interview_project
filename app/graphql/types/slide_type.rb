module Types
  class SlideType < Types::BaseObject
    field :id, ID, null: false
    field :type, String, null: true
    field :demo_id, Integer, null: false
    field :active, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
