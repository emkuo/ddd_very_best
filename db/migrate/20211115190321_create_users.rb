class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :email
      t.string :password
      t.string :username
      t.boolean :cancel_account

      t.timestamps
    end
  end
end
