class AddMissingIndexMagicSet < ActiveRecord::Migration[5.2]
  def change
    add_index :magic_sets, :code
  end
end
