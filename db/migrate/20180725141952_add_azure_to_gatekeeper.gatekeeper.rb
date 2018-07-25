# This migration comes from gatekeeper (originally 20180618124458)
class AddAzureToGatekeeper < ActiveRecord::Migration[4.2]
  def change
    add_column :gatekeeper_identities, :email, :string
    add_column :gatekeeper_identities, :last_login, :datetime

    add_reference :gatekeeper_roles_identities, :department, index: true
    add_column :gatekeeper_roles_identities, :assigned_by, :string

    remove_index :gatekeeper_roles_identities, columns: [:identity_id, :role_id], name: 'gatekeeper_combined_identity_role_index'
    add_index :gatekeeper_roles_identities, [:identity_id, :role_id, :department_id], unique: true, name: 'gatekeeper_combined_identity_role_index'

    rename_table :gatekeeper_roles_identities, :gatekeeper_identity_roles

    add_column :gatekeeper_identity_roles, :id, :primary_key

    create_table :gatekeeper_departments do |t|
      t.string :name

      t.timestamps
    end

    create_table :gatekeeper_department_roles do |t|
      t.belongs_to :department, index: true, null: false
      t.belongs_to :role

      t.timestamps
    end

    remove_index :gatekeeper_identities, :name
    add_index :gatekeeper_identities, :email, unique: true
  end
end
