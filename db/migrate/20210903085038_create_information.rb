class CreateInformation < ActiveRecord::Migration[6.0]
  def change
    create_table :information do |t|
      t.text :content,            null: false
      t.references :sub_issue,    null: false, foreign_key: true 
      t.timestamps
    end
  end
end
