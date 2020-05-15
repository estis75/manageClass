class AddClassidToClasstables < ActiveRecord::Migration[6.0]
  def change
    add_column :classtables, :classid, :integer
  end
end
