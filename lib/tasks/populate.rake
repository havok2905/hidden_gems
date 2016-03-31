namespace :hidden_gems do
  desc 'adds new records'
  task populate: :environment do
    PopulatePlaces.populate
  end
end
