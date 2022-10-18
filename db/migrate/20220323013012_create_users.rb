class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :dotName
      t.string :role
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.string :remember_token
      t.datetime :remember_token_expires_at

      t.timestamps
    end
  end
end
