class PortoRestaurantCustomer < ApplicationRecord
  validates :email, uniqueness: true
  include PgSearch::Model
  pg_search_scope :porto_restaurant_search,
    against: [ :city, :country, :name, :genre ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
  def self.to_csv(fields = column_names, options =  {})
    CSV.generate(options) do |csv| #generates a file#
      csv << fields
      all.each do |customer|
        csv << customer.attributes.values_at(*fields)
      end
    end
  end
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      PortoRestaurantCustomer.where(email: row[3]).first_or_create do |c|
        c.genre = row[0]
        c.name = row[1]
        c.surname = row[2]
        c.country = row[4]
        c.zipcode = row[5]
        c.city = row[6]
        c.birth = row[7]
      end
    end
  end
end
