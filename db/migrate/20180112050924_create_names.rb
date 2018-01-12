class CreateNames < ActiveRecord::Migration[5.1]
  def change
    create_table :names do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
