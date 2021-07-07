module Types
  class MutationType < Types::BaseObject
    field :activate_slide, mutation: Mutations::Slides::ActivateSlide
    field :start_demo, mutation: Mutations::Demos::StartDemo
  end
end
