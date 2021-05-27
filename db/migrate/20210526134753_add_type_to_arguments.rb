class AddTypeToArguments < ActiveRecord::Migration[6.1]
  def change
    add_column :arguments, :type, :integer
  end
end
