class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.text :nickname
      t.text :name
      t.text :first_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
