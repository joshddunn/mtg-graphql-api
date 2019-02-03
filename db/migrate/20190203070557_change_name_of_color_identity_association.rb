class ChangeNameOfColorIdentityAssociation < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :color_identity_associations, :color_identities
    rename_column :color_identity_associations, :color_identity_id, :color_id
    drop_table :color_identities
    add_foreign_key :color_identity_associations, :colors
  end
end
