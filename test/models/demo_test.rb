require 'test_helper'

class DemoTest < ActiveSupport::TestCase
  test 'basic creation' do
    demo = Demo.new
    assert demo.save
  end

  test 'associations' do
    demo = Demo.new
    slide = Slide.new
    presentation = Presentation.new

    assert_empty demo.presentations
    assert_empty demo.slides

    demo.slides << slide
    demo.presentations << presentation

    assert_not_empty demo.presentations
    assert_not_empty demo.slides
  end
end
