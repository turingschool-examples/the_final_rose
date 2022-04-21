class RemoveStringFromOutings < ActiveRecord::Migration[5.2]
  def change
    remove_column :outings, :string, :date
  end
end
