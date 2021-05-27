class AddRepliesToArguments < ActiveRecord::Migration[6.1]
  def up
    change_table :arguments do |t|
      t.references :argument, index: true
    end
  end

  def down
    change_table :arguments do |t|
      t.remove_references :argument
    end
  end
end
