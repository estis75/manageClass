class CreateClasstables < ActiveRecord::Migration[6.0]
  def change
    create_table :classtables do |t|
      t.integer :key
      t.string :name
      t.text :url

      t.timestamps
    end
  end
end
