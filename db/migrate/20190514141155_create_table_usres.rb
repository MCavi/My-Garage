class CreateTableUsres < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true

    create_table :vehicles do |t|
      t.integer :user_id, null: false
      t.integer :year, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.float :engine_size
      t.string :transmission
      t.string :vin
      t.integer :mileage
      t.timestamps
    end

    add_index :vehicles, :user_id


    create_table :maintenance_items do |t|
      t.integer :vehicle_id, null: false
      t.integer :user_id, null: false
      t.string :title, null: false
      t.date :date_preformed, null: false
      t.string :comment
      t.integer :current_mileage
      t.float :cost
      t.timestamps
    end

    add_index :maintenance_items, :vehicle_id
    add_index :maintenance_items, :user_id

  end
end
