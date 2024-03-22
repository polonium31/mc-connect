class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :linkedin
      t.string :instagram
      t.string :email
      t.string :program_name
      t.string :department
      t.text :interest
      t.string :password_digest

      t.timestamps
    end
  end
end
