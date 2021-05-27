class AddRepliesToArguments < ActiveRecord::Migration[6.1]
  def up
    change_table :arguments do |t|
      t.references :claim, foreign_key: { to_table: :arguments }
    end
  end

  def down
    change_table :arguments do |t|
      t.remove_references :claim, foreign_key: { to_table: :arguments }
    end
  end

end