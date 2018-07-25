# This migration comes from gatekeeper (originally 20131014144509)
class CreateGatekeeperPermissionsRoles < ActiveRecord::Migration[4.2]
  def change
    create_table :gatekeeper_permissions_roles, :id => false do |t|
      t.belongs_to :permission, index: true, null: false
      t.belongs_to :role, index: true, null: false
    end

    add_index :gatekeeper_permissions_roles, [:permission_id, :role_id], :unique => true, :name => 'gatekeeper_combined_permission_role_index'
  end
end
