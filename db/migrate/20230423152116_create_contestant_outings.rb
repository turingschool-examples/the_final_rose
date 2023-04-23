class CreateContestantOutings < ActiveRecord::Migration[5.2]
  def change
    create_table :contestant_outings do |t|
      t.bigint "contestant_id", foreign_key: true
      t.bigint "outing_id", foreign_key: true

      t.timestamps
    end
  end
end
