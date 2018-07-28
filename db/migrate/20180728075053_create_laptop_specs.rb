class CreateLaptopSpecs < ActiveRecord::Migration
  def change
    create_table :laptop_specs do |t|
      t.string :brand
      t.string :model_name
      t.integer :price
      t.string :cpu
      t.integer :cpu_score
      t.string :gpu
      t.integer :gpu_score
      t.integer :ram
      t.integer :hdd
      t.integer :ssd
      t.integer :battery
      t.float :monitor
      t.float :weight
      t.timestamps null: false
    end
  end
end
