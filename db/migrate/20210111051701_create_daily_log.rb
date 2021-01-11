class CreateDailyLog < ActiveRecord::Migration
  def change
    create_table :daily_logs do |t|
      t.date :date
      t.string :title
      t.text :description
    end
  end
end
