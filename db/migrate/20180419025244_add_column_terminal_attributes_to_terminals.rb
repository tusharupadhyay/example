class AddColumnTerminalAttributesToTerminals < ActiveRecord::Migration[5.1]
  def change
    add_column :terminals, :terminal_attributes, :text
  end
end
