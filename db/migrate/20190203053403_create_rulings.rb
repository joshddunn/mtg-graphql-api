class CreateRulings < ActiveRecord::Migration[5.2]
  def change
    create_table :rulings do |t|
      t.references :card, foreign_key: true
      t.date :date
      t.string :text

      t.timestamps
    end
  end
end
