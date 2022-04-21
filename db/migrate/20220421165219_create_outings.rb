class CreateOutings < ActiveRecord::Migration[5.2]
  def change
    create_table :outings do |t|
      t.string :name
      t.string :location
      t.string :outing_date

      t.timestamps
    end
  end
end
