class CreateFoodLogEntry < ActiveRecord::Migration
  def change
    create_table :food_log_entries do |t|
      t.date :date
      t.text :breakfast
      t.text :lunch
      t.text :dinner
      t.text :snacks
      t.integer :water_intake
      #water will be tracked by glasses 
    end
  end
end
