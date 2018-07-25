# This migration comes from gatekeeper (originally 20131014144354)
class CreateGatekeeperRolesIdentities < ActiveRecord::Migration[4.2]
  def change
    create_table :gatekeeper_roles_identities, :id => false do |t|
      t.belongs_to :identity, index: true, null: false
      t.belongs_to :role, index: true, null: false
    end

    add_index :gatekeeper_roles_identities, [:identity_id, :role_id], :unique => true, :name => 'gatekeeper_combined_identity_role_index'
  end
end
