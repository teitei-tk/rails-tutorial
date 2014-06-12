class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :user_id
      t.string :title
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
