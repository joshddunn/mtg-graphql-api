class CreateCardTokenAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :card_token_associations do |t|
      t.references :card, foreign_key: true
      t.references :token, foreign_key: true

      t.timestamps
    end

    add_index :cards, :name
  end
end
