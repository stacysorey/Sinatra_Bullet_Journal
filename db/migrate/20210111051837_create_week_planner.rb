class CreateWeekPlanner < ActiveRecord::Migration
  def change
    create_table :week_planner do |t|
      t.date :date
      t.text :monday
      t.text :tuesday
      t.text :wednesday
      t.text :thursday
      t.text :friday
      t.text :weekend
    end
  end
end
