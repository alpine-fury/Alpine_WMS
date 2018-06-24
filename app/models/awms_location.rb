class AwmsLocation < ActiveRecord::Base
  self.table_name = 'locations'
  def self.column_headers
    self.column_names.map {|e| e.to_sym}
  end
end
