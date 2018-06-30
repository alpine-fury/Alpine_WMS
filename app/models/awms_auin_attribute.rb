class AwmsAuinAttribute < ActiveRecord::Base
  self.table_name = 'auin_attributes'
  self.primary_keys = :uin
  def self.column_headers
    self.column_names.map {|e| e.to_sym}
  end
end
