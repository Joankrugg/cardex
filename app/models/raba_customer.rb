class RabaCustomer < ApplicationRecord
  validates :email, format: { with:  /\A[^@\s]+@[^@\s]+\z/}, allow_blank: true
  include PgSearch::Model
  pg_search_scope :raba_search,
    against: [ :city, :country, :name, :genre, :email ],
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
      RabaCustomer.where(email: row[7]).first_or_create do |c|
        c.genre = row[0]
        c.name = row[1]
        c.surname = row[2]
        c.city = row[3]
        c.zipcode = row[4]
        c.country = row[5]
        c.phone = row[6]
        c.birth = row[8]
        c.segment = row[9]
      end
    end
  end
end
