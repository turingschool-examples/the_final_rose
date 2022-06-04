class CreateJoinTableContestantsOutings < ActiveRecord::Migration[5.2]
  def change
    create_join_table :contestants, :outings, table_name: :contestant_outings do |t|
       t.index [:contestant_id, :outing_id]
       t.index [:outing_id, :contestant_id]
    end
  end
end
