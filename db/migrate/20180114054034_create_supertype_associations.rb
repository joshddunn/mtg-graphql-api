class CreateSupertypeAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :supertype_associations do |t|
      t.references :card, foreign_key: true
      t.references :supertype, foreign_key: true

      t.timestamps
    end
  end
end
