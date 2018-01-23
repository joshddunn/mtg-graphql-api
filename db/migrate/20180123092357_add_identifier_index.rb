class AddIdentifierIndex < ActiveRecord::Migration[5.1]
  def change
    add_index :cards, :identifier
  end
end
