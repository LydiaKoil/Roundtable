class RemoveTextFromArguments < ActiveRecord::Migration[6.1]
  def change
    remove_column :arguments, :text, :string
  end
end
