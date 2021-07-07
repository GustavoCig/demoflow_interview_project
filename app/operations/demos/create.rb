module Demos
  class Create < BaseOperation
    def initialize(title)
      @demo = Demo.new(title: title)
    end

    def call!
      Demo.transaction do
        @demo.save!
        @demo.presentations.create(start_time: Time.current)
      end

      @demo
    end
  end
end
