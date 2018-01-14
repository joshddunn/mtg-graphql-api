class CreateSubtypes < ActiveRecord::Migration[5.1]
  def change
    create_table :subtypes do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
