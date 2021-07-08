require 'test_helper'

class SlidePresentationTest < ActiveSupport::TestCase
  test 'basic creation' do
    slide_presentation = SlidePresentation.new
    assert_not slide_presentation.valid?

    demo = Demo.create

    slide_presentation.slide = Slide.create(demo: demo)
    assert_not slide_presentation.valid?

    slide_presentation.presentation = Presentation.create(demo: demo)
    assert slide_presentation.valid?
  end
end
