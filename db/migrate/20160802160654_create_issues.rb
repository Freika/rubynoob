class CreateIssues < ActiveRecord::Migration[5.0]
  def change
    create_table :issues do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :repository_id

      t.timestamps
    end
    add_index :issues, :repository_id
  end
end
