class CreateFitnessEntry < ActiveRecord::Migration
  def change
    create_table :fitness_entries do |t|
        t.date :date
        t.string :workout
        t.string :length
        t.text :description
    end
  end
end
