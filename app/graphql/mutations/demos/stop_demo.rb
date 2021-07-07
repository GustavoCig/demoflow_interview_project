module Mutations
  module Demos
    class StopDemo < BaseMutation
      field :demo, Types::DemoType, null: false

      argument :demo_id, ID, required: true

      def resolve(demo_id:)
        {
          demo: ::Demos::Stop.new(demo_id).call!
        }
      end
    end
  end
end
