class CreateSubtypeAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :subtype_associations do |t|
      t.references :card, foreign_key: { primary_key: :multiverseid }
      t.references :subtype, foreign_key: true

      t.timestamps
    end
  end
end
