class CreatePrintingAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :printing_associations do |t|
      t.references :card, foreign_key: true
      t.references :magic_set, foreign_key: true

      t.timestamps
    end
  end
end
