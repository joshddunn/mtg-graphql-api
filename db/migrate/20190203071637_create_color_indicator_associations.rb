class CreateColorIndicatorAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :color_indicator_associations do |t|
      t.references :card, foreign_key: true
      t.references :color, foreign_key: true

      t.timestamps
    end
  end
end
