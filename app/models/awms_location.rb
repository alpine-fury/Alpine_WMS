class AwmsLocation < ActiveRecord::Base
  self.table_name = 'locations'
  def self.column_headers
    self.column_names.map {|e| e.to_sym}
  end

  def self.csv_update(file)
    data_header = ['id','location_name','location_type','location_desc','pick_order','temperature']
    @csv_load = Array.new
    CSV.foreach(file.path, headers: true) do |row|
      @csv_load << self.new(row.to_h)
    end
    puts @csv_load
    self.import @csv_load, :validate => true, on_duplicate_key_update: data_header
  end
end
