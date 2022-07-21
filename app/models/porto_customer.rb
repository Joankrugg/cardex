class PortoCustomer < ApplicationRecord
  validates :email, format: { with:  /\A[^@\s]+@[^@\s]+\z/}, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
  include PgSearch::Model
  pg_search_scope :porto_search,
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
end
