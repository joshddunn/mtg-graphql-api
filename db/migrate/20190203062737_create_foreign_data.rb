class CreateForeignData < ActiveRecord::Migration[5.2]
  def change
    create_table :foreign_data do |t|
      t.string :flavor_text
      t.string :language
      t.integer :multiverse_id
      t.string :name
      t.string :text
      t.string :card_type
      t.references :card, foreign_key: true

      t.timestamps
    end
  end
end
