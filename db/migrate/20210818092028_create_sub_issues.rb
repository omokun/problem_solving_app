class CreateSubIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_issues do |t|
      t.text :title,            null: false
      t.text :hypothesis
      t.text :new_hypothesis
      t.text :sub_conclusion
      t.references :main_issue, null: false, foreign_key: true 
      t.timestamps
    end
  end
end
