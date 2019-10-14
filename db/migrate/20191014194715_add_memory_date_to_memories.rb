class AddMemoryDateToMemories < ActiveRecord::Migration[6.0]
  def change
    add_column :memories, :memory_date, :date
  end
end
