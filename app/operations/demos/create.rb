module Demos
  class Create < BaseOperation
    def initialize(title)
      @demo = Demo.where(title: title)
                  .first_or_initialize
    end

    def call!
      Demo.transaction do
        @demo.save!
        @demo.presentations
             .create(start_time: Time.current)
      end

      @demo
    end
  end
end
