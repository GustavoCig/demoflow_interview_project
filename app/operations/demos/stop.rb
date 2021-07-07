module Demos
  class Stop < BaseOperation
    def initialize(id)
      @demo = Demo.find(id)
    end

    def call!
      Demo.transaction do
        @demo.presentations
             .find_by(end_time: nil)
             .update(end_time: Time.current)
      end

      @demo
    end
  end
end
