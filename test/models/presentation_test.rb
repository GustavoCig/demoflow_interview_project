require 'test_helper'

class PresentationTest < ActiveSupport::TestCase
  def setup
    @demo = Demo.new
    @presentation = Presentation.new(demo: @demo)
  end

  test 'basic creation' do
    assert @presentation.save
  end

  test 'start/end_time validation' do
    @presentation.start_time = Time.current
    assert @presentation.valid?

    @presentation.end_time = 5.minutes.ago
    assert_not @presentation.valid?

    @presentation.end_time = 1.hour.from_now
    assert @presentation.valid?
  end

  test 'only one ongoing per demo validation' do
    assert @presentation.update(start_time: Time.current)

    other_presentation = Presentation.new(demo: @demo)
    assert_not other_presentation.valid?

    other_presentation.start_time = Time.current
    assert_not other_presentation.valid?

    other_presentation.end_time = 5.minutes.from_now
    assert other_presentation.valid?
  end

  test 'total_time' do
    @presentation.start_time = Time.current
    @presentation.end_time = @presentation.start_time + 5.minutes

    assert_equal 5 * 60.0, @presentation.total_time
  end

  test 'time_spent_per_slide' do
    assert_empty @presentation.time_spent_per_slide

    start_time = Time.current
    end_time = start_time + 5.minutes

    slide_presentation = SlidePresentation.new(start_time: start_time, end_time: end_time)
    @presentation.slide_presentations << slide_presentation

    result = @presentation.time_spent_per_slide

    assert_not_empty result
    assert_equal [nil, 300.0], result.first.values
  end
end
