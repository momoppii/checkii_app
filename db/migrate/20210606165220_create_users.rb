class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :birthday
      t.string :belong
      t.text :underlying_diseases
      t.text :vaccine

      t.timestamps
    end
  end
end
