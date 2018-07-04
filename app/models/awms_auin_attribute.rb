class AwmsAuinAttribute < ActiveRecord::Base
  self.table_name = 'auin_attributes'
  self.primary_keys = :auin
  def self.column_headers
    self.column_names.map {|e| e.to_sym}
  end

  def self.missing_attr_location
    missing_data = self.connection.exec_query("
      select distinct ii.auin
      from locations l
      join inventory_items ii
        on ii.location_id = l.id
      where ii.auin in (select distinct auin from auin_attributes)")
    inv_records = []

    missing_data.each do |row|
      inv_records << self.connection.exec_query("
        	(select ii.auin, l.id, l.location_name, ii.quantity, ii.condition, 'Y' as xtra
        		from locations l
        		join inventory_items ii
        			on ii.location_id = l.id
        		where (l.pick_order > 0 and l.is_pickable = 'Y')
        		and ii.auin = '#{row['auin']}'
        		order by l.pick_order asc)
        	union
        	(select ii.auin, l.id, l.location_name, ii.quantity, ii.condition, 'N' as xtra
        		from locations l
        		join inventory_items ii
        			on ii.location_id = l.id
        		where (l.pick_order = 0 or l.is_pickable = 'N')
        		and ii.auin = '#{row['auin']}'
        		order by l.id asc);"
      ).first
    end
    return inv_records
  end

  def self.csv_update(file)
    data_headers = CSV.read(file.path, headers: true).headers
    @csv_load = Array.new
    CSV.foreach(file.path, headers: true) do |row|
      @csv_load << self.new(row.to_h)
    end
    puts @csv_load
    self.import @csv_load, :validate => true, on_duplicate_key_update: data_headers
  end

end
