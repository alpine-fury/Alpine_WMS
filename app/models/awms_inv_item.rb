class AwmsInvItem < ActiveRecord::Base
  require 'composite_primary_keys'
  self.table_name = 'inventory_items'
  self.primary_keys = :location_id, :uin, :condition
  def self.column_headers
    self.column_names.map {|e| e.to_sym}
  end
end
