class RemoveAttributesFromTerminals < ActiveRecord::Migration[5.1]
  def change
    remove_column :terminals, :attributes
    remove_column :terminals, :preferences
  end
end
