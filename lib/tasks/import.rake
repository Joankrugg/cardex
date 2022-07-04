require 'csv'
namespace :import do
  desc "Import data from spreadsheet"
  task import_csv: :environment do
    CSV.foreach("arf.csv", :headers => true) do |row|
      Customer.create!(row.to_hash)
    end
  end
end


