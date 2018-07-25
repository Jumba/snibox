# This migration comes from gatekeeper (originally 20180627082954)
class AddEngineToPermission < ActiveRecord::Migration[5.1]
  def change
    add_column :gatekeeper_permissions, :engine, :string
    remove_index :gatekeeper_permissions, columns: [:method, :controller, :action], name: 'combined_method_controller_action_index'
    add_index :gatekeeper_permissions, [:method, :controller, :action, :engine], unique: true, name: 'combined_method_controller_action_index'
  end
end
