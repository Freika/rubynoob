class CreateRepositories < ActiveRecord::Migration[5.0]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :description
      t.string :url
      t.integer :user_id

      t.timestamps
    end
    add_index :repositories, :user_id
  end
end
