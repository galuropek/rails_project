class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.string :name
      t.string :fisrt_name
      t.integer :age

      t.timestamps
    end
  end
end
