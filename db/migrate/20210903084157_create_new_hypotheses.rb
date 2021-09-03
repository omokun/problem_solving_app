class CreateNewHypotheses < ActiveRecord::Migration[6.0]
  def change
    create_table :new_hypotheses do |t|

      t.timestamps
    end
  end
end
