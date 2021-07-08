require 'test_helper'

class SlideTest < ActiveSupport::TestCase
  def setup
    @demo = Demo.new
    @slide = Slide.new(demo: @demo, slide_type: 'web')
  end

  test 'basic creation' do
    assert @slide.valid?

    @slide.slide_type = 'gibberish'
    assert_not @slide.valid?

    Slide::TYPES.each do |type|
      @slide.slide_type = type
      assert @slide.valid?
    end
  end

  test 'associations' do
    @demo.save
    @slide.save

    presentation = Presentation.create(demo: @demo)
    slide_presentation = SlidePresentation.create(presentation: presentation)

    assert_empty @slide.presentations
    assert_empty @slide.slide_presentations

    @slide.slide_presentations << slide_presentation
    @slide.reload

    assert_not_empty @slide.presentations
    assert_not_empty @slide.slide_presentations
  end

  test 'active scope' do
    @demo.save

    @slide.slide_type = 'web'
    @slide.save

    assert_empty Slide.active

    @slide.update(active: true, demo: @demo)

    assert_not_empty Slide.active
  end

  test 'activate!' do
    @demo.save

    assert_not @slide.active

    presentation = Presentation.create(demo: @demo, start_time: Time.current)

    @slide.activate!
    @slide.reload
    presentation.reload

    assert @slide.active
    assert_not_empty presentation.slide_presentations
    assert_not_nil presentation.slide_presentations.first.start_time
    assert_equal presentation.slides.first, @slide
  end

  test 'deactivate!' do
    @demo.save

    assert_not @slide.active

    presentation = Presentation.create(demo: @demo, start_time: Time.current)
    presentation.slide_presentations.create(slide: @slide, start_time: 5.minutes.ago)
    @slide.deactivate!

    @slide.reload
    presentation.reload

    assert_not @slide.active
    assert_not_nil presentation.slide_presentations.first.end_time
  end
end
