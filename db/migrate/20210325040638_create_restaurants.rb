class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :logoUrl
      t.string :gallery , array: true , default: []

      t.timestamps
    end
  end
end
