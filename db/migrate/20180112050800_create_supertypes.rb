class CreateSupertypes < ActiveRecord::Migration[5.1]
  def change
    create_table :supertypes do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
