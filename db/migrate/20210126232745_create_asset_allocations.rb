class CreateAssetAllocations < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_allocations do |t|
      t.integer :domestic_currency_deposits
      t.integer :foreign_currency_deposits
      t.integer :domestic_stocks
      t.integer :foreign_stocks
      t.integer :domestic_bonds
      t.integer :foreign_bonds
      t.integer :real_estate
      t.integer :gold
      t.integer :insurance
      t.integer :others
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
