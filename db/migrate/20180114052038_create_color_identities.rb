class CreateColorIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :color_identities do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
