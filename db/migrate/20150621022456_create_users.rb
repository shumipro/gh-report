class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid, index: true, unique: true
      t.string  :nickname
      t.string  :email
      t.string  :name
      t.string  :image
      t.string  :token

      t.timestamps null: false
    end
  end
end
