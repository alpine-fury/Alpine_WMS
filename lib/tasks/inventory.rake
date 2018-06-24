namespace :inventory do
  desc "Stage environment with sample data."
  task move: :environment do
    location_id = 1
    uin = '070382171643'
    quantity_add = -2
    condition = 'NEW'

    data_header = ['location_id','uin','quantity','condition']
    is_created = AwmsInvItem.where(location_id: location_id,uin: uin,condition: condition).to_a
    puts is_created.inspect
    if is_created.count == 0
      puts "uploading data"
      puts "bad"
      data_array = [location_id,uin,quantity_add,condition]
      AwmsInvItem.import data_header,data_array, :validate => false, onduplicate_key_update: data_header
      puts "uploaded data"
    else
      puts "uploading data"
      initial_quantity = is_created.collect(&:quantity)
      puts initial_quantity.inspect
      new_quantity = (quantity_add + initial_quantity[0]) < 0 ? 0 : (quantity_add + initial_quantity[0])
      puts new_quantity.inspect
      AwmsInvItem.where(location_id: location_id,uin:uin,condition:condition).update(quantity:new_quantity)
      puts "uploaded data"
    end
  end
end
