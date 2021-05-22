class CreateCommentReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_reactions do |t|
      t.integer :user_id
      t.integer :comment_id
      t.integer :reaction, default: 0

      t.timestamps
    end
    add_index :comment_reactions, [:comment_id, :user_id], unique: true
  end
end
