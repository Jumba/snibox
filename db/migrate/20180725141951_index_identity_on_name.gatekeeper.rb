# This migration comes from gatekeeper (originally 20131014145546)
class IndexIdentityOnName < ActiveRecord::Migration[4.2]
  def change
    add_index :gatekeeper_identities, :name, :unique => true
  end
end
