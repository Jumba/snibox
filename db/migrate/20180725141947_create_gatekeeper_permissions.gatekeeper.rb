# This migration comes from gatekeeper (originally 20131011123813)
class CreateGatekeeperPermissions < ActiveRecord::Migration[4.2]
  def change
    create_table :gatekeeper_permissions do |t|
      t.string :method
      t.string :controller, null: false
      t.string :action, null: false
      t.string :path, null: false

      t.timestamps
    end

    add_index :gatekeeper_permissions, [:method, :controller, :action], :unique => true, :name => 'combined_method_controller_action_index'
  end
end
