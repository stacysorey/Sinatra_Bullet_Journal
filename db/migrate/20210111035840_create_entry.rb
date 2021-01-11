class CreateEntry < ActiveRecord::Migration
  def change
    create_table :entry do |t|
      t.date :date
      t.integer :journal_id
    end
  end
end
