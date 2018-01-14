class CreateAlternativeNames < ActiveRecord::Migration[5.1]
  def change
    create_table :alternative_names do |t|
      t.references :magic_set, foreign_key: true
      t.string :identifier

      t.timestamps
    end
  end
end
