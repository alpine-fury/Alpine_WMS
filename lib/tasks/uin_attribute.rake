namespace :uin_attribute do
  desc "Stage environment with sample data."
  task create: :environment do
    uin = '070382171643'
    item_name = 'Meguiars Gold Class Car Wash 64fl.oz.'
    item_desc = 'Car Wash: Shampoo & Conditioner 64fl.oz.'
    puts "uploading data"
    @rake_run = AwmsUinAttribute.find_or_create_by(uin: uin)
    puts @rake_run.inspect
    @rake_run.item_name = item_name
    @rake_run.item_desc = item_desc
    @rake_run.save if @rake_run.changed?
    puts "uploaded data"
  end
end
