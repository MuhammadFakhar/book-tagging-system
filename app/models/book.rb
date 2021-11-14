class Book < ApplicationRecord
  belongs_to :author

  has_one_attached :avatar

  has_many :book_tags
  has_many :tags, :through => :book_tags

  validates :name, presence: true, uniqueness: true
end
