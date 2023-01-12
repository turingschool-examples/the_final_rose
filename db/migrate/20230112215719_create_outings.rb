class CreateOutings < ActiveRecord::Migration[5.2]
  def change
    create_table :outings do |t|
      t.string :title
      t.string :location
      t.datetime :date
      t.timestamps
    end
  end
end
