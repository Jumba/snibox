# This migration comes from gatekeeper (originally 20131008135351)
class CreateGatekeeperIdentities < ActiveRecord::Migration[4.2]
  def change
    create_table :gatekeeper_identities do |t|
      t.string :name

      t.timestamps
    end
  end
end
