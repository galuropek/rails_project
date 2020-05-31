class CreateCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :crews do |t|
      t.text :name
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end