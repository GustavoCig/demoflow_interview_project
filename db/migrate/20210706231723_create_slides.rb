class CreateSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slides do |t|
      t.string :type
      t.boolean :active, default: false

      t.timestamps
    end

    add_index :slides, :type
    add_index :slides, :active
  end
end
