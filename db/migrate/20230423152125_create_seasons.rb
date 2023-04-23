class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :season_number, foreign_key: true
      t.string :description

      t. timestamps
    end
  end
end
