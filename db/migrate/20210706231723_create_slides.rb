class CreateSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slides do |t|
      t.string :slide_type
      t.references :demo, null: false, foreign_key: true
      t.boolean :active, default: false

      t.timestamps
    end

    add_index :slides, :slide_type
    add_index :slides, :active
  end
end
