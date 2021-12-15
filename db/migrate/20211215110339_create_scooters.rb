class CreateScooters < ActiveRecord::Migration[6.0]
  def change
    create_table :scooters do |t|
      t.string :marque
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
