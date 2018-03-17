class CreateSubs < ActiveRecord::Migration[5.1]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :url
      t.string :content
      t.integer :moderator_id, null: false

      t.timestamps
    end
    add_index :subs, :moderator_id, unique: true
  end
end
