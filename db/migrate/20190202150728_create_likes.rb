class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.integer :likeable_id
      t.string :likeable_type
      t.timestamps
    end
    add_index :likes, [:likeable_type, :likeable_id, :created_at]
    add_index :likes, [:user_id, :created_at]
  end
end
