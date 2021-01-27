class CreateMonthlyExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :monthly_expenses do |t|
      t.integer :year
      t.integer :month
      t.integer :house
      t.integer :food
      t.integer :clothes
      t.integer :education
      t.integer :daily_necessities
      t.integer :car
      t.integer :medical_treatment
      t.integer :entertainment
      t.integer :communication
      t.integer :social
      t.integer :insurance
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
