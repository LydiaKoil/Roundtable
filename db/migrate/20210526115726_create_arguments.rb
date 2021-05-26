class CreateArguments < ActiveRecord::Migration[6.1]
  def change
    create_table :arguments do |t|
      t.string :title
      t.string :body
      t.string :text
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
