class CreateMainIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :main_issues do |t|
      t.text :title,       null: false
      t.text :conclusion
      t.references :user,  null: false, foreign_key: true 
      t.timestamps
    end
  end
end
