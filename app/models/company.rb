class Company < ApplicationRecord
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Company.create! row.to_h
    end
  end
end


