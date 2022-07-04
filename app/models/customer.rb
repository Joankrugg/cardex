class Customer < ApplicationRecord
  validates :email, format: { with:  /\A[^@\s]+@[^@\s]+\z/}, presence: true
  validates :email, uniqueness: true
  def self.to_csv(fields = column_names, options =  {})
    CSV.generate(options) do |csv|
      csv << fields
      all.each do |customer|
        csv << customer.attributes.values_at(*fields)
      end
    end
  end


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Customer.create! row.to_h
    end
  end
end

