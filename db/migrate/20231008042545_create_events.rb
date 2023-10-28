class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name,   null: false
      t.string :catch_copy, null: false
      t.text   :explanation, null: false
      t.date   :event_date, null: false
      t.time   :event_time, null: false
      t.string :place
      t.string :capacity
      t.string :price
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
