class AddNamesToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :names, :jsonb
  end
end
