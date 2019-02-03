class CreateTokenColorIndicatorAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :token_color_indicator_associations do |t|
      t.references :token, foreign_key: true
      t.references :color, foreign_key: true

      t.timestamps
    end
  end
end
