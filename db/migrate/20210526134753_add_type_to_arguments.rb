class AddTypeToArguments < ActiveRecord::Migration[6.1]
  def change
    add_column :arguments, :reply_type, :integer, index: true
  end
end
