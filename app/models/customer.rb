class Customer < ApplicationRecord
  validates :mail, uniqueness: true
  belongs_to :sector, optional: true
  belongs_to :creator, optional: true
  belongs_to :type, optional: true
  belongs_to :home, optional: true

  include PgSearch::Model
  pg_search_scope :customer_search,
    against: [ :name, :mail, :city, :country, :zipcode],
    associated_against:{
    creator: [ :name ],
    type: [ :name ],
    sector: [ :name ]
  },
    using: {
      tsearch: { prefix: true }
    }

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
      Customer.where(mail: row[1]).first_or_create do |c|
        c.name = row[0]
      end
    end
  end
end

