module Types
  class TimePerSlideType < Types::BaseObject
    field :id, ID, null: false
    field :time, Float, null: false
  end
end
