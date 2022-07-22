class MillesimeCustomer < ApplicationRecord
  validates :mail, format: { with:  /\A[^@\s]+@[^@\s]+\z/}, allow_blank: true
  include PgSearch::Model
  pg_search_scope :millesime_search,
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
      Customer.where(mail: row[7]).first_or_create do |c|
        c.genre = row[0]
        c.name = row[1]
        c.surname = row[2]
        c.address = row[3]
        c.city = row[4]
        c.zipcode = row[5]
        c.country = row[6]
        c.phone = row[8]
        c.birth = row[9]
        c.home = row[10]
        c.segment = row[11]
      end
    end
  end
end
