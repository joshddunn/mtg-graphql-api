class CreateVariations < ActiveRecord::Migration[5.1]
  def change
    create_table :variations do |t|
      t.references :card, foreign_key: { primary_key: :multiverseid }

      t.timestamps
    end

    add_reference :variations, :variation, foreign_key: { to_table: :cards, primary_key: :multiverseid }
  end
end
