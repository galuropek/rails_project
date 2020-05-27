class CreateCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :crews do |t|
      t.text :name
      t.string :description
      t.integer :owner

      t.timestamps
    end
  end
end
