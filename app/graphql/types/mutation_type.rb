module Types
  class MutationType < Types::BaseObject
    field :activate_slide, mutation: Mutations::Slides::ActivateSlide
  end
end
