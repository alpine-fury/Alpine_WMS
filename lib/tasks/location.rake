# frozen_string_literal: true

namespace :location do
  desc 'Stage environment with sample data.'
  task create: :environment do
    location_name = 'g_closet'
    location_type = 'closet'
    location_desc = 'Guest/Spare Closet'
    puts 'uploading data'
    AwmsLocation.create(location_name: location_name,
                        location_type: location_type,
                        location_desc: location_desc)
    puts 'uploaded data'
  end
end
