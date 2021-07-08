# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

demo = Demo.create(title: 'Sales Presentation')

web_slide = Slide.create(demo: demo, slide_type: 'web', active: true)
html_slide = Slide.create(demo: demo, slide_type: 'html')
image_slide = Slide.create(demo: demo, slide_type: 'image')

presentation = Presentation.create(demo: demo, start_time: 1.hour.ago)

SlidePresentation.create(slide: web_slide, presentation: presentation, start_time: 5.minutes.ago)
SlidePresentation.create(slide: html_slide, presentation: presentation, start_time: 20.minutes.ago, end_time: 6.minutes.ago)
SlidePresentation.create(slide: image_slide, presentation: presentation, start_time: 1.hour.ago, end_time: 25.minutes.ago)
