class CreateClassinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :classinfos do |t|
      t.string :day
      t.integer :th
      t.text :url
      t.string :class

      t.timestamps
    end
  end
end
