class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :habit
      t.integer :time

      t.timestamps
    end
  end
end
