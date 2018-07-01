class AwmsAuinAttribute < ActiveRecord::Base
  self.table_name = 'auin_attributes'
  self.primary_keys = :uin
  def self.column_headers
    self.column_names.map {|e| e.to_sym}
  end

  def self.csv_update(file)
    data_header = ['auin','item_name','item_desc']
    @csv_load = Array.new
    CSV.foreach(file.path, headers: true) do |row|
      @csv_load << self.new(row.to_h)
    end
    puts @csv_load
    self.import @csv_load, :validate => true, on_duplicate_key_update: data_header
  end

end
