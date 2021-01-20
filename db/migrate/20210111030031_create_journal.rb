class CreateJournal < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :title
      t.integer :User_id
    end
  end
end
