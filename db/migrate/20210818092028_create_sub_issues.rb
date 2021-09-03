class CreateSubIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_issues do |t|
      t.text :title,            null: false
      t.references :main_issue, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
