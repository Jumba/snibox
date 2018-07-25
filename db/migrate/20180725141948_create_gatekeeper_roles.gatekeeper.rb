# This migration comes from gatekeeper (originally 20131014144248)
class CreateGatekeeperRoles < ActiveRecord::Migration[4.2]
  def change
    create_table :gatekeeper_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
