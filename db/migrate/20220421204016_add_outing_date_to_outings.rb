class AddOutingDateToOutings < ActiveRecord::Migration[5.2]
  def change
    add_column :outings, :outing_date, :string
  end
end
