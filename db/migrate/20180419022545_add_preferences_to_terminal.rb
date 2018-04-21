class AddPreferencesToTerminal < ActiveRecord::Migration[5.1]
  def change
    add_column :terminals, :preferences, :text
  end
end
