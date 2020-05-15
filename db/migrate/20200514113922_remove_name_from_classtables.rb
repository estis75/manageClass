class RemoveNameFromClasstables < ActiveRecord::Migration[6.0]
  def change
    remove_column :classtables, :url, :text
    remove_column :classtables, :name, :string
  end
end
