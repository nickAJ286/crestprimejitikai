class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name,   null: false
      t.string :catch_copy, null: false
      t.text   :explanation
      t.date   :event_date
      t.time   :event_time
      t.string :place
      t.string :capacity
      t.string :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
