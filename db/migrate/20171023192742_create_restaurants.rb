class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :opening_time
      t.integer :closing_time
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
