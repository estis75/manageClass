class RenameClassinfosClassClassname < ActiveRecord::Migration[6.0]
  def change
    rename_column :classinfos, :class, :classname
  end
end
