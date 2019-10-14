class AddUserIdToMemories < ActiveRecord::Migration[6.0]
  def change
    add_column :memories, :user_id, :integer
  end
end
