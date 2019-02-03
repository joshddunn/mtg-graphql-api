class CreateVariations < ActiveRecord::Migration[5.1]
  def change
    create_table :variations do |t|
      t.references :card, foreign_key: true

      t.timestamps
    end

    add_reference :variations, :variation, foreign_key: { to_table: :cards }
  end
end
