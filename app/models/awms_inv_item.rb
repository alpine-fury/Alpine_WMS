# frozen_string_literal: true

class AwmsInvItem < ActiveRecord::Base
  require 'composite_primary_keys'
  require 'csv'

  self.table_name = 'inventory_items'
  self.primary_keys = :location_id, :auin, :condition
  def self.column_headers
    self.column_names.map {|e| e.to_sym}
  end

  def self.inv_update(location_id, auin, quantity_add, condition)
    data_header = ['location_id','auin','quantity','condition','expiration_date']
    is_created = self.where(location_id: location_id,auin: auin,condition: condition).to_a
    puts is_created.inspect
    if is_created.count.zero?
      puts 'uploading data'
      data_array = [[location_id,auin,quantity_add.to_i,condition]]
      self.import data_header,data_array , :validate => false, on_duplicate_key_update: data_header
      puts 'uploaded data'
    else
      puts 'uploading data'
      initial_quantity = is_created.collect(&:quantity)
      puts initial_quantity.inspect
      new_quantity = (quantity_add.to_i + initial_quantity[0]).negative? ? 0 : (quantity_add.to_i + initial_quantity[0])
      puts new_quantity.inspect
      self.where(location_id: location_id,auin:auin,condition:condition).update(quantity:new_quantity)
      puts 'uploaded data'
    end
  end

  def self.csv_update(file)
    data_headers = CSV.read(file.path, headers: true).headers
    loc_check = CSV.read(file.path, headers: true).map { |e| e['location_id']}.uniq
    act_loc = AwmsLocation.select('id').distinct.where(id: [loc_check])
    return 'FAILURE' if loc_check.count > act_loc.count
    @csv_load = Array.new
    CSV.foreach(file.path, headers: true) do |row|
      @csv_load << self.new(row.to_h)
    end
    puts @csv_load

    self.import @csv_load, :validate => true, on_duplicate_key_update: data_headers
    return 'SUCCESS'
  end
end
