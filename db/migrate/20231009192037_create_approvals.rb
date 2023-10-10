class CreateApprovals < ActiveRecord::Migration[6.0]
  def change
    create_table :approvals do |t|
      t.references :user,             null: false, foreign_key: true
      t.references :event,            null: false, foreign_key: true
      t.integer    :pros_and_cons_id, null: false
      t.string     :opinion
      t.timestamps
    end
  end
end
