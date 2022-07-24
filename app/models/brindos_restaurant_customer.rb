class BrindosRestaurantCustomer < ApplicationRecord
  validates :email, format: { with:  /\A[^@\s]+@[^@\s]+\z/}, allow_blank: true
  validates :email, uniqueness: true
  include PgSearch::Model
  pg_search_scope :brindos_restaurant_search,
    against: [ :city, :country, :name, :genre, :email, :unsubscribe  ],
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
      BrindosProCustomer.where(email: row[6]).first_or_create do |c|
        c.genre = row[0]
        c.name = row[1]
        c.surname = row[2]
        c.zipcode = row[3]
        c.city = row[4]
        c.country = row[5]
        c.birth = row[7]
        c.segment = row[8]
      end
    end
  end
end
