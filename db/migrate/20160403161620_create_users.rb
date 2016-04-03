class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :access_token
      t.string :email
      t.boolean :admin
      t.string :provider
      t.string :password_digest

      t.timestamps
    end
  end
end
