module Types
  class MutationType < Types::BaseObject
    field :activate_slide, mutation: Mutations::Slides::ActivateSlide
    field :start_demo, mutation: Mutations::Demos::StartDemo
    field :stop_demo, mutation: Mutations::Demos::StopDemo
  end
end
