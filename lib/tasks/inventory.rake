# frozen_string_literal: true

namespace :inventory do
  desc 'Stage environment with sample data.'
  task :edit, %i[location_id auin quantity condition] => :environment do |t,params|
    # location_id = 1
    # uin = '070382171643'
    # quantity_add = 1
    # condition = 'NEW'

    AwmsInvItem.inv_update(params.location_id,
                           params.auin,
                           params.quantity,
                           params.condition.upcase)

  end
end
