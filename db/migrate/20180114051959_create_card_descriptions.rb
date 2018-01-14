class CreateCardDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :card_descriptions do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
