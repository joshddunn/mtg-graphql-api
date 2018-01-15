class CreateColorIdentityAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :color_identity_associations do |t|
      t.references :card, foreign_key: true 
      t.references :color_identity, foreign_key: true

      t.timestamps
    end
  end
end
