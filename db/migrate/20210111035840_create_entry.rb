class CreateEntry < ActiveRecord::Migration
  def change
    create_table :entry do |t|
      t.date :date
    end
  end
end
