class CreateConclusions < ActiveRecord::Migration[6.0]
  def change
    create_table :conclusions do |t|
      t.text :content,            null: false
      t.references :main_issue,   null: false, foreign_key: true 
      t.timestamps
    end
  end
end
