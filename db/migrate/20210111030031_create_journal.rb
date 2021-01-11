class CreateJournal < ActiveRecord::Migration
  def change
    create_table :journal do |t|
      t.string :title
      t.integer :entry_id
      t.integer :user_id
    end
  end
end
