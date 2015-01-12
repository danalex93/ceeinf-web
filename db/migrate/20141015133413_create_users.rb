class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :year
      t.integer :rol
      t.boolean :ceeinf

      t.timestamps null: false
    end
  end
end
