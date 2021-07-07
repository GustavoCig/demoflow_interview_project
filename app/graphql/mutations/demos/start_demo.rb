module Mutations
  module Slides
    class StartDemo < BaseMutation
      field :demo, Types::DemoType, null: false

      argument :title, String, required: true

      def resolve(title:)
        {
          demo: ::Demos::Create.new(title).call!
        }
      end
    end
  end
end
