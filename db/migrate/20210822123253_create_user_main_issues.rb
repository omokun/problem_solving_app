class CreateUserMainIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :user_main_issues do |t|
      t.references :user, null: false, foreign_key: true
      t.references :main_issue, null: false, foreign_key: true
      t.timestamps
    end
  end
end
