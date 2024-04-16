class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name
      t.text :address
      t.string :province  # Added province field
      t.string :username  # Add this if you want a username

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true  # Add this if you want a username
  end
end
