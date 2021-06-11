class AddSlugToArgument < ActiveRecord::Migration[6.1]
  def change
    add_column :arguments, :slug, :string
    add_index :arguments, :slug, unique: true
  end
end
