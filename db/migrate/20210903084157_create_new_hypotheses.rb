class CreateNewHypotheses < ActiveRecord::Migration[6.0]
  def change
    create_table :new_hypotheses do |t|
      t.text :content,            null: false
      t.references :hypothesis,   null: false, foreign_key: true 
      t.timestamps
    end
  end
end