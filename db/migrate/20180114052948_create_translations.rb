class CreateTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :translations do |t|
      t.references :magic_set, foreign_key: true
      t.string :code
      t.string :identifier

      t.timestamps
    end
  end
end
