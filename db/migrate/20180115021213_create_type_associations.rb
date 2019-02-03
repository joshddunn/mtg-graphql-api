class CreateTypeAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :type_associations do |t|
      t.references :card, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
