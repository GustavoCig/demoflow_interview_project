class CreateSlidePresentations < ActiveRecord::Migration[6.0]
  def change
    create_table :slide_presentations do |t|
      t.references :slide, null: false, foreign_key: true
      t.references :presentation, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
