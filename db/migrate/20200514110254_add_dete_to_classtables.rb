class AddDeteToClasstables < ActiveRecord::Migration[6.0]
  def change
    add_column :classtables, :day, :string
    add_column :classtables, :th, :integer
  end
end
