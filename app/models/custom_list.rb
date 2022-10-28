class CustomList < ApplicationRecord
  validates :email, format: { with:  /\A[^@\s]+@[^@\s]+\z/}, presence: true
  validates :email, uniqueness: true
  include PgSearch::Model
  pg_search_scope :custom_search,
    against: [ :city, :country, :name, :genre, :email, :unsubscribe ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
