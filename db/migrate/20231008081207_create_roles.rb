class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :type_id, null: false
      t.timestamps
    end
  end
end
