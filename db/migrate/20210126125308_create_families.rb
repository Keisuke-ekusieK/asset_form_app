class CreateFamilies < ActiveRecord::Migration[6.0]
  def change
    create_table :families do |t|
      t.boolean :spouse
      t.integer :children
      t.integer :parent
      t.integer :worker
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
