class Book < ApplicationRecord
  belongs_to :author

  has_one_attached :avatar

  has_many :book_tags
  has_many :tags, :through => :book_tags

  validates :title, presence: true, uniqueness: true

  scope :custom_filtering, ->(min_price, max_price, tags) { where("price >= ? AND price<= ?", min_price, max_price)
                            .joins(:tags).where( tags: { id: tags }) }
end
