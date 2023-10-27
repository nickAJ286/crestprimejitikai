class CreateBeforeComments < ActiveRecord::Migration[6.0]
  def change
    create_table :before_comments do |t|
      t.string  :content, null: false
      t.references :event, null: false, foreign_key: true
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
