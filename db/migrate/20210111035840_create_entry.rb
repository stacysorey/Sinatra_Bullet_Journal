class CreateEntry < ActiveRecord::Migration
  def change
    create_table :entry do |t|
      t.date :date
      t.integer :journal_id
      t.string :title
      t.text :description
    end
  end
end
