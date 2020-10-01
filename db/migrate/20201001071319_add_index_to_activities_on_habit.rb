class AddIndexToActivitiesOnHabit < ActiveRecord::Migration[6.0]
  def change
    add_index :activities, %i[habit user_id], unique: true
  end
end
