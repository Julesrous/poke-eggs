class CreatePokeggs < ActiveRecord::Migration[6.0]
  def change
    create_table :pokeggs do |t|
      t.string :name
      t.string :category
      t.date :birthday
      t.string :region
      t.text :state
      t.monetize :price, currency: { present: false }
      t.boolean :available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
