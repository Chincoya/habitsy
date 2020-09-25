# frozen_string_literal: true

# Add name column to users table
class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
  end
end
