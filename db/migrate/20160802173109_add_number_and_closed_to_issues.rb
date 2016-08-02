class AddNumberAndClosedToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :number, :integer, default: 0, null: false
    add_column :issues, :closed, :boolean, default: false
  end
end
