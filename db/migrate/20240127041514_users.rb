class Users < ActiveRecord::Migration[7.1]
  def up
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.timestamps
    end

    User.create!(name: 'Alice', email: 'alice@in-chains.com')
    User.create!(name: 'Bob', email: 'bobs@burgers.com')
  end

  def down
    drop_table :users
  end
end
