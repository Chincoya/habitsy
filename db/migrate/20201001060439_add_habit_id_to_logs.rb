class AddHabitIdToLogs < ActiveRecord::Migration[6.0]
  def change
    change_table :logs do |t|
      t.references :activity, null: false, foreign_key: true
    end
  end
end
