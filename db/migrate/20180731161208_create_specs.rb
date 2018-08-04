class CreateSpecs < ActiveRecord::Migration
  def change
    create_table :specs do |t|
      
      t.string :brand
      t.string :name
      t.integer :price
      t.string :cpu
      t.integer :cpuscore
      t.string :gpu
      t.integer :gpuscore
      t.integer :ram
      t.integer :hdd
      t.integer :ssd
      t.integer :battery
      t.float :display
      t.float :weight
      
      t.timestamps null: false
    end
  end
end
