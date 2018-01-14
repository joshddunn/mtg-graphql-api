class CreateBoosters < ActiveRecord::Migration[5.1]
  def change
    create_table :boosters do |t|
      t.references :magic_set, foreign_key: true
      t.integer :position
      t.references :card_description, foreign_key: true

      t.timestamps
    end
  end
end
