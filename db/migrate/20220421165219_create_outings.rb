class CreateOutings < ActiveRecord::Migration[5.2]
  def change
    create_table :outings do |t|
      t.string :activity

      t.timestamps
    end
  end
end
